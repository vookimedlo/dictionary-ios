# dictionary-ios

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/vookimedlo/dictionary-ios/master/LICENSE) 
[![Platform](https://img.shields.io/badge/platforms-iOS%2014.2|MacOS%2011.0.1%2B-ff69b4.svg)](https://img.shields.io/badge/platforms-iOS%2014.2|MacOS%2011.0.1%2B-ff69b4.svg)
[![GitHub release](https://img.shields.io/github/release/vookimedlo/dictionary-ios.svg?label=latest%20release)](https://github.com/vookimedlo/dictionary-ios/releases/latest)
[![Codebeat badge](https://codebeat.co/badges/f8715d72-0ed9-4685-b160-36c1be6605f6)](https://codebeat.co/projects/github-com-vookimedlo-dictionary-ios-master)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fvookimedlo%2Fdictionary-ios.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fvookimedlo%2Fdictionary-ios?ref=badge_shield)

Open English/Czech dictionary for the iOS platform - available in [the App Store][5].

Open English/Czech dictionary for the Mac platform - available in [the Mac App Store][6].

## Motivation
My motivation to implement this application was to learn how to develop iOS-based applications. As a side-effect, I also wanted to know what all procedures are required to submit a final app in the Apple App Store. Later, this project was also updated to be fully compatible with the Mac Catalyst.

## What you can learn by analyzing this project

1) SQLite.swift framework
   - How to use Swift Manager controlled packages
   - How to embed any framework in the app 
   - Basic framework usage
2) Dictionary data database
   - How to convert FDL English/Czech data source to the SQLite database
   - How to add custom build steps
3) UI
   - How to design UI in XCode StoryBoard editor
   - How to interact with code
   - How to initiate a screen transition (back and forth)
   - How to use the custom controllers and delegates
   - How to use a tap gesture recognizer
   - How to use a table widget
   - How to use a search widget
   - How to use different UI settings for iPhone and iPad
   - How to detect specific iPhone version for disabling UI widgets
4) Localization
   - How to provide a localization support
5) VoiceOver support
   - How to detect if any voice is available for the given language
   - How to instruct iOS to say the given text
6) Lint
   - How to include a [swiftlint][2] checks in a build process
   - How to suppress specific rules
7) Catalyst
   - How to update the iOS aware application to support the Catalyst Intel x64 or Apple Silicon architecture

## Dictionary data
Dictionary data are taken from the [Free Dictionaries][3] project, which is good enough for my testing purposes.
During the conversion from the data source file to the application SQLite based database, all records which have the empty
translation are removed intentionally. At the time of writing this, there were 63539 of such records.

## Images
All images are taken from the [openclipart.org][4] project.

## All available screens in the application

The application is fully translated into the Czech language. However, only the default - English - language is shown here.

### Splash screen
![dictionary-ios splash screen](doc/images/dictionary-ios-encz-splash.png?raw=true "") 

----

### English to Czech screens
![dictionary-ios en2cz screen](doc/images/dictionary-ios-encz-en2cz.png?raw=true "")
![dictionary-ios en2cz search screen](doc/images/dictionary-ios-encz-en2cz-search.png?raw=true "")
![dictionary-ios en2cz detail screen](doc/images/dictionary-ios-encz-en2cz-detail.png?raw=true "")

----

### Czech to English screens
![dictionary-ios cz2en screen](doc/images/dictionary-ios-encz-cz2en.png?raw=true "")
![dictionary-ios cz2en search screen](doc/images/dictionary-ios-encz-cz2en-search.png?raw=true "")
![dictionary-ios cz2en detail screen](doc/images/dictionary-ios-encz-cz2en-detail.png?raw=true "")

----

### About screens
![dictionary-ios about screen](doc/images/dictionary-ios-encz-about.png?raw=true "")
![dictionary-ios components screen](doc/images/dictionary-ios-encz-components.png?raw=true "")

----


[1]: https://github.com/vookimedlo/dictionary-ios
[2]: https://github.com/realm/SwiftLint
[3]: https://github.com/svobodneslovniky/svobodneslovniky
[4]: https://openclipart.org/
[5]: https://apps.apple.com/us/app/dictionary-english-czech/id1468782740?ls=1
[6]: https://apps.apple.com/us/app/dictionary-english-czech/id1485464273?ls=1


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fvookimedlo%2Fdictionary-ios.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fvookimedlo%2Fdictionary-ios?ref=badge_large)
