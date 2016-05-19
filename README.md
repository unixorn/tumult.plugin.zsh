# Tumult

## About

Tumult is an oh-my-zsh compatible plugin that adds OS X-specific functions and scripts to your ZSH environment.

Tumult will check to see if you're running on OS X and not add aliases or inject its bin into your PATH if you aren't. This allows you to use the same plugin list in all your environments without polluting your ZSH with incompatible functions and scripts on your non-Mac machines.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Included scripts](#included-scripts)
- [Other Useful OS X scripts](#other-useful-os-x-scripts)
- [Installation](#installation)
  - [[Antigen](https://github.com/zsh-users/antigen)](#antigenhttpsgithubcomzsh-usersantigen)
  - [[Oh-My-Zsh](http://ohmyz.sh/)](#oh-my-zshhttpohmyzsh)
  - [[Zgen](https://github.com/tarjoilija/zgen)](#zgenhttpsgithubcomtarjoilijazgen)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Included scripts

* 720p - Resets an application's window to 720p (1280x720) for better screencasting. Doesn't work with apps that don't support window resizing in their AppleScript dictionary. From Derrick Bailey's [blog](http://lostechies.com/derickbailey/2012/09/08/screencasting-tip-resize-your-app-to-720p-1280x720-in-osx/)
* battery-percentage - Show the percentage of battery charge
* battery-time - Show the estimated battery life.
* clear-osx-font-cache - Clears the OSX font cache, originally from [awesome-osx-command-line](https://github.com/herrbischoff/awesome-osx-command-line/blob/master/functions.md#app-icons)
* column-view - Set the current directory to column view in the Finder
* eject-all - Eject all removable disks
* evernote - Create a new Evernote note from stdin or a file
* finder-path - Show the path to the frontmost finder window
* finder-selection - Show the paths to all items selected in the Finder, quoted so it copes with spaces in your directory or file names
* icon-view - Set the current directory to icon view in the Finder
* kick-afp - Restart file sharing. I got tired of having to remote desktop in to kick the fileserver every time Apple's file sharing got wedged
* kick-screensharing - Sometimes screen sharing just hangs on my Mini running 10.11. This is not new to 10.11, it was exhibiting the same annoying behavior on 10.10 and 10.9. The mini is headless and it's a pain in the ass to plug it into the TV just long enough to restart screen sharing, so I wrote this so I can fix it over ssh.
* list-view - Set the current directory to column view in the Finder
* lockscreen - lock the screen
* mkdmg - Makes a .dmg file from a directory
* mkicns - Creates an .icns file from an image file
* osx-frontmost-app - Shows what application is Frontmost.
* pbcurl - Indent clipboard text four spaces and update pboard with result. With `-o`, write result to standard output instead of to the pboard. From Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles)
* pbindent - Run sed(1) on the contents of the clipboard and put the result back on the clipboard. All sed options and arguments are supported. From Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles)
* pbsed - Run sed(1) on the contents of the clipboard and put the result back on the clipboard. All sed options and arguments are supported. From Ryan Tomayko's [dotfiles](https://github.com/rtomayko/dotfiles)
* screen-resolution - Display the screen resolution
* set-osx-hostname - Set the OS X name of your machine. No, `sudo hostname newname` isn't enough if you want the new name to be visible on the network for things like File or Screen sharing.
* speedup-apple-mail - Speeds up Mail.app by vaccuuming the indexes - Originally from [http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/](http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/)
* toggle-finder-show-dotfiles - Toggle whether Finder shows dotfiles
* volume - Get/set the system volume
* wifi-name - Returns the name of the WIFI network you're connected to

## Other Useful OS X scripts

* [Platypus](https://github.com/sveinbjornt/Platypus) - allows you to wrap a script inside a Mac GUI wrapper.

## Installation

Tumult is packaged as a zsh plugin to make it easier to use if you're already using a zsh framework (I recommend zgen, it is wicked fast and also supports using oh-my-zsh's internal plugins).

### Bash / not using a framework

If you're using bash, or aren't using a framework, just clone this repository and add its bin to your `$PATH`.

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
