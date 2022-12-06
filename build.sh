#!/usr/bin/env bash

set -eu -o pipefail

source build.conf
source utils.sh

print_usage() {
	echo -e "Usage:\n${0} build|clean|reset-template"
}

if [ -z ${1+x} ]; then
	print_usage
	exit 0
elif [ "$1" = "clean" ]; then
	rm -rf revanced-cache build.md build
	reset_template
	exit 0
elif [ "$1" = "reset-template" ]; then
	reset_template
	exit 0
elif [ "$1" = "build" ]; then
	:
else
	print_usage
	exit 1
fi

: >build.md
mkdir -p "$BUILD_DIR" "$TEMP_DIR"

if [ "$UPDATE_PREBUILTS" = true ]; then get_prebuilts; else set_prebuilts; fi
reset_template
get_cmpr

if ((COMPRESSION_LEVEL > 9)) || ((COMPRESSION_LEVEL < 1)); then
	abort "COMPRESSION_LEVEL must be between 1 and 9"
fi

log "**App Versions:**"
build_youtube &
build_music &
build_twitter &
build_reddit &
build_twitch &
build_tiktok &
build_spotify &
build_ticktick &
build_warn_wetter &
build_backdrops &
build_windy &

wait

if [ "$BUILD_MINDETACH_MODULE" = true ]; then
	echo "Building mindetach module"
	cd mindetach-magisk/mindetach/
	: >detach.txt
	if [ "${YOUTUBE_MODE%/*}" = module ] || [ "${YOUTUBE_MODE%/*}" = both ]; then echo "com.google.android.youtube" >>detach.txt; fi
	if [ "${TWITTER_MODE%/*}" = module ] || [ "${TWITTER_MODE%/*}" = both ]; then echo "com.twitter.android" >>detach.txt; fi
	if [ "${REDDIT_MODE%/*}" = module ] || [ "${REDDIT_MODE%/*}" = both ]; then echo "com.reddit.frontpage" >>detach.txt; fi
	if [ "${TIKTOK_MODE%/*}" = module ] || [ "${TIKTOK_MODE%/*}" = both ]; then echo $TIKTOK_PACKAGE >>detach.txt; fi
	if [ "${SPOTIFY_MODE%/*}" = module ] || [ "${SPOTIFY_MODE%/*}" = both ]; then echo "com.spotify.music" >>detach.txt; fi
	if [ "${WARN_WETTER_MODE%/*}" = module ] || [ "${WARN_WETTER_MODE%/*}" = both ]; then echo "de.dwd.warnapp" >>detach.txt; fi
	if [ "${TWITCH_MODE%/*}" = module ] || [ "${TWITCH_MODE%/*}" = both ]; then echo "tv.twitch.android.app" >>detach.txt; fi
	if [ "${TICKTICK_MODE%/*}" = module ] || [ "${TICKTICK_MODE%/*}" = both ]; then echo "com.ticktick.task" >>detach.txt; fi
	if [ "${BACKDROPS_MODE%/*}" = module ] || [ "${BACKDROPS_MODE%/*}" = both ]; then echo "com.backdrops.wallpapers" >>detach.txt; fi
	if [ "${WINDY_MODE%/*}" = module ] || [ "${WINDY_MODE%/*}" = both ]; then echo "co.windyapp.android" >>detach.txt; fi
	if [ "${MUSIC_ARM64_V8A_MODE%/*}" = module ] || [ "${MUSIC_ARM_V7A_MODE%/*}" = module ] || [ "${MUSIC_ARM64_V8A_MODE%/*}" = both ] || [ "${MUSIC_ARM_V7A_MODE%/*}" = both ]; then
		echo "com.google.android.apps.youtube.music" >>detach.txt
	fi
	zip -r ../../build/mindetach-"$(grep version= module.prop | cut -d= -f2)".zip .
	cd ../../
fi

if [[ "${YOUTUBE_MODE%/*}" =~ ^(apk|both)$ || "${MUSIC_ARM64_V8A_MODE%/*}" =~ ^(apk|both)$ || "${MUSIC_ARM_V7A_MODE%/*}" =~ ^(apk|both)$ ]]; then
	log "\nInstall [Vanced Microg](https://github.com/inotia00/VancedMicroG/releases) to be able to use non-root YouTube or Music"
fi
log "\n[revanced-extended-builds-repo](https://github.com/E85Addict/revanced-extended-builds)"

reset_template
echo "Done"
