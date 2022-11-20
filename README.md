#  InnateMC

A native minecraft launcher for macOS. Built using Swift and SwiftUI.

## Features
- [ ] Launch Vanilla Minecraft in offline mode
- [ ] Install fabric and legacy fabric 
- [ ] Install liteloader
- [ ] Install quilt

## Installation
InnateMC is heavily under development and does not provide a binary at the moment. You can build the project in Xcode if you wish.

## Structure  
This project is divided into three main subprojects - InnateMC, InnateKit and InnateJson
- InnateMC holds the UI for the launcher
- InnateKit holds all launcher logic such as downloading versions, installing mod loaders, etc.
- InnateJson is a json parser in objective-c because yes

## Supported macOS versions
macOS 11 (Big Sur) and above are supported.

## License
This software is licensed under the GNU General Public License Version 3
