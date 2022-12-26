CLI: revanced-cli-2.18.3-all.jar  
Integrations: app-release-unsigned-v0.86.0.apk  
Patches: revanced-patches-2.147.0.jar  

[Added features]
- Overall fix to the ReVanced Settings interface. settings are now placed in the correct categories
- Ad filter update
- `Enable always swipe gesture`: Always enable swipe regardless of whether the controller is visible or not.
- `Hide film strip overlay`
- `Disable haptic feedback`: chapters, seek, scrubbing, zoom
- `Hide player flyout panel`
- `Channel Whitelisting`: Video Ads, Video Speed, SponsorBlock
- Now you can copy the current playing time by pressing and holding the copy with timestamp button
- Changed the resource of overlay buttons
- Reduced the size of overlay buttons by 20%
- VR icons now also support overlay buttons icon
- Now the `materialyou` and `amoled` patches work independently
(e.g. materialyou + amoled = materialyou light + amoled black)
- You can now set a custom video speed via the `options.toml` file
- You can now change the package name via the `options.toml` file (non-root only)
- You can now check which patches are included or excluded in the settings
- Autorepeat now works for playlists too
- Now, if the SponsorBlock server is taken down, the mirror server is automatically designated as the default server
- Added return youtube dislike mirror server

[Bugfix]
- fix: Pull-to-refresh not working in home feed
- fix: Back button not working in home feed
- fix: SponsorBlock skip segment button is misplaced on some videos
- fix: Hide info card setting is buggy
- fix: Some SponsorBlock icons are not displayed properly
- fix: More drawer icon is broken on some devices

[Bugfix (temporary)]
- Swipe brightness control on HDR videos are acting funky
- Swipe for brighness and volume doesn't work after double tap (temporary: changed to always recognize swipes)
- `fix video playback` setting causes infinite skip of playlists

[Etc]
- Rewrite most of the code
- Added support for YouTube v17.49.37
- Ended support for Android 6 & 7 (YouTube v17.34.36)
- Support `settings-framework`. All patches work independently, excluded patches are also removed from settings UI (YouTube only)
- Removed unused language resources
- All settings now work as intended when the switch is ON
- Most of the code has been completely rewritten, so a clean install is recommended.
- Removed `custom-package-name` patch. The default package name has now been changed to `app.rvx.android.youtube`, and can be changed via `options.toml`
- `amoled` patch has been renamed to `theme` patch

[Credits]
@0xrxL: Implementation of Pull-to-refresh
@caneleex: Implementation of Channel Whitelist Removal Preference and true-ryd-worker (mirror)

※ Compatible ReVanced Manager: v0.0.52
  
**App Versions:**  
YouTube: 17.49.37
downloaded from: [APKMirror - YouTube](https://www.apkmirror.com/apk/google-inc/youtube/youtube-17-49-37-release/youtube-17-49-37-2-android-apk-download/)  
Music (arm64-v8a): 5.36.51
downloaded from: [APKMirror - Music (arm64-v8a)](https://www.apkmirror.com/apk/google-inc/youtube-music/youtube-music-5-36-51-release/youtube-music-5-36-51-android-apk-download/)  

Install [Vanced Microg](https://github.com/inotia00/VancedMicroG/releases) to be able to use non-root YouTube or Music  

[revanced-extended-builds](https://github.com/E85Addict/revanced-extended-builds)  
