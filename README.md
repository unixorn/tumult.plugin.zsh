# Tumult

## About

Tumult is an oh-my-zsh compatible plugin that adds a lot of OS X-specific functions and scripts to your environment.

Tumult will check to see if you're running on OS X and not load itself if you aren't. This allows you to use the same plugin list in all your environments without polluting your ZSH with incompatible functions and scripts on non-Mac machines.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Tumult](#tumult)
  - [About](#about)
  - [Included scripts](#included-scripts)
  - [Installation](#installation)
    - [[Antigen](https://github.com/zsh-users/antigen)](#antigenhttpsgithubcomzsh-usersantigen)
    - [[Oh-My-Zsh](http://ohmyz.sh/)](#oh-my-zshhttpohmyzsh)
    - [[Zgen](https://github.com/tarjoilija/zgen)](#zgenhttpsgithubcomtarjoilijazgen)
  - [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Included scripts

* battery-percentage - Show the percentage of battery charge
* battery-time - Show the estimated battery life.
* clear-osx-font-cache - Clears the OSX font cache, originally from [awesome-osx-command-line](https://github.com/herrbischoff/awesome-osx-command-line/blob/master/functions.md#app-icons)
* speedup-apple-mail - Speeds up Mail.app by vaccuuming the indexes - Originally from [http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/](http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/)
* column-view - Set the current directory to column view in the Finder
* eject-all - Eject all removable disks
* evernote - Create a new Evernote note from stdin or a file
* finder-path - Show the path to the frontmost finder window
* finder-selection - Show the paths to all items selected in the Finder, quoted so it copes with spaces in your directory or file names
* icon-view - Set the current directory to icon view in the Finder
* list-view - Set the current directory to column view in the Finder
* lockscreen - lock the screen
* mkdmg - Makes a .dmg file from a directory
* mkicns - Creates an .icns file from an image file
* osx-frontmost-app - Shows what application is Frontmost
* screen-resolution - Display the screen resolution
* set-osx-hostname - Set the OS X name of your machine. No, `hostname newname` isn't enough if you want the new name to be visible on the network for things like File or Screen sharing
* volume - Get/set the system volume
* wifi-name - Returns the name of the WIFI network you're connected to

## Installation

### [Antigen](https://github.com/zsh-users/antigen)

Add `antigen bundle unixorn/tumult.plugin.zsh` to your `.zshrc` with your other bundle commands.

Antigen will handle cloning the plugin for you automatically the next time you start zsh. You can also add the plugin to a running zsh with `antigen bundle unixorn/tumult.plugin.zsh` for testing before adding it to your `.zshrc`.

### [Oh-My-Zsh](http://ohmyz.sh/)

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:unixorn/tumult.plugin.zsh.git`
3. Add the repo to your plugin list

### [Zgen](https://github.com/tarjoilija/zgen)

Add `zgen load unixorn/tumult.plugin.zsh` to your .zshrc file in the same function you're doing your other `zgen load` calls in.

## License

Tumult is Apache 2.0 licensed, except for some scripts in bin that have other license statements inline.
