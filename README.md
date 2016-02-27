
LogDisabler
======

LogDisabler is an Xcode's plug in that enable and disable all your console messages (NSLog,print).
If you are like me, then you use NSLog to print messages in console in order to check or debug your app.
Before uploading to the App Store that messages to the console has to be disabled because they might expose critical data (API urls, tokens, user's data).

###Features

+ Supports Objective-C
+ Supports Swift
+ Enable all log messages
+ Disable all log messages

###Installation
- Through [Alcatraz](https://github.com/alcatraz/Alcatraz)
- Download, build the project and restart Xcode

###How to use it

- Go to Edit-> Manage Logs and choose "Enable Logs" or "Disable Logs"
- Using shortcuts CTRL+SHIFT+E to enable logs or CTRL+SHIFT+D to disable logs

###Unistall
Delete the LogDisabler.xcplugin in `~/Library/Application Support/Developer/Shared/Xcode/Plug-ins/`


###Authors

* Michael Mavris

###License

Copyright Miksoft 2016

Licensed under the MIT License
