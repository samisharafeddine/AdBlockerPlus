# AdBlockerPlus
![alt tag](http://i.imgur.com/hEWEBUq.png)

###Description
AdBlocker+ is a safari content blocker extension that blocks ads on webpages that you visit using safari. It also disables tracking and block domains known to spread malware.

###How does it work
AdBlocker+ uses filters to block all unwanted elements, Filter lists are essentially an extensive set of rules that tell AdBlocker+ which elements of a website to block.

###Features
- Block Ads: Blocks most annoying ads you might encounter while surfing the web.
- Disable malware domains: It protects you from spreading malware and infecting others.
- Dramatically improves surfing speed: Since heavy ads are not loaded with webpage, webpages load very fast compared to webpages with ads.

###Limitations
- ***This app only works with 64-bit devices on iOS 9 and later [Due to limitations set by apple].***
- ***AdBlockerPlus only works with iOS Safari in the meantime.***

###Implementation notes
***If you want to install this app on your iOS device via Xcode, please do the following:***
- Change the Bundle ID of the app `com.Sami-Sharaf.iAdBlockerPlus` to your desired Bundle ID.
- Change the Bundle ID of the AdBlocker Extension `com.Sami-Sharaf.iAdBlockerPlus.BlockMethod` to your desired Bundle ID.
- In the Project Navigator, head over `AdBlockerPlusConstants.h` and change `APP_EXTENSION_NAME` to your Bundle ID of the AdBlocker Extension (Cuz u did set that, didn't you ?).
- If you want to change the rules .json file, make sure you set `APP_DEFAULT_BLOCKS_FILE` in `AdBlockerPlusConstants.h` to your desired file name.

###App Store availability
This App is available on the apple App Store for free as of 1/10/2016 [v1.10.0]:
https://itunes.apple.com/us/app/adblocker+-lightweight-ad/id1081172537?ls=1&mt=8
