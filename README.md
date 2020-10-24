# Tumult

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![CircleCI](https://circleci.com/gh/unixorn/tumult.plugin.zsh.svg?style=shield)](https://circleci.com/gh/unixorn/tumult.plugin.zsh)
[![Code Climate](https://codeclimate.com/github/unixorn/tumult.plugin.zsh/badges/gpa.svg)](https://codeclimate.com/github/unixorn/tumult.plugin.zsh)
[![GitHub stars](https://img.shields.io/github/stars/unixorn/bigriver-tools.svg)](https://github.com/unixorn/bigriver-tools/stargazers)
[![Issue Count](https://codeclimate.com/github/unixorn/tumult.plugin.zsh/badges/issue_count.svg)](https://codeclimate.com/github/unixorn/tumult.plugin.zsh)

## About

Tumult is an [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)-compatible plugin that adds macOS-specific functions and scripts to your ZSH environment.

Some of these are mine, and have an Apache 2.0 license, some of them were written by other people - the authors and licenses are embedded in those scripts.

Tumult will check to see if you're running on macOS and not add aliases or inject its bin into your `$PATH` if you aren't. This allows you to use the same plugin list in all your environments without polluting your `$PATH` with incompatible functions and scripts on your non-Apple machines.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Included scripts](#included-scripts)
- [Other Useful macOS tools](#other-useful-macos-tools)
- [Installation](#installation)
  - [Bash / not using a framework](#bash--not-using-a-framework)
  - [Antigen](#antigen)
  - [Oh-My-Zsh](#oh-my-zsh)
  - [Zgen](#zgen)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Included scripts

| Script | Description |
| ------ | ----------- |
| `720p` | Resets an application's window to 720p (1280x720) for better screencasting. Doesn't work with apps that don't support window resizing in their AppleScript dictionary. Copied from Derrick Bailey's [blog](http://lostechies.com/derickbailey/2012/09/08/screencasting-tip-resize-your-app-to-720p-1280x720-in-osx/) |
| `battery-percentage` | Show the percentage of battery charge |
| `battery-time` | Show the estimated battery life. |
| `change-wallpaper` | If you have your desktop wallpaper set to rotate through a folder of images at intervals, this will force an immediate switch |
| `clean-xml-clip` | Clean up the XML on the clipboard |
| `chrome` | Force opening an URL with Chrome |
| `chrome-tabs` | Outputs the URLs for all your open Chrome tabs so you can snapshot them |
| `clean-clipboard` | Converts contents of clipboard to plain text. |
| `clear-macos-font-cache` | Clears the macOS font cache, originally from [awesome-osx-command-line](https://github.com/herrbischoff/awesome-osx-command-line/blob/master/functions.md#app-icons) |
| `column-view` | Set the current directory to column view in the Finder |
| `diceware-password` | Generate a random but memorable passphrase using the Diceware Passphrase Algorithm. See [http://world.std.com/~reinhold/diceware.html](http://world.std.com/~reinhold/diceware.html) |
| `disable-bouncing-dock-icons` | Disable icons bouncing in your Dock |
| `disable-ftp-server` | Disable the ftp server on a Mac |
| `disable-network-ds-store` | Disable writing `.DS_Store` files to network shares|
| `disable-ssh-server` | Disable the ssh server on a Mac |
| `disable-startup-chime` | Disable the boot chime |
| `disturb` | Re-enable notifications in Notification Center |
| `do-not-disturb` | Stifle notifications in Notification Center |
| `eject-all` | Eject all removable disks |
| `enable-bouncing-dock-icons` | Enable icons bouncing in your Dock |
| `enable-ftp-server` | Enable the ftp server on a Mac |
| `enable-ssh-server` | Enable the ssh server on a Mac |
| `enable-startup-chime` | Re-enable the boot chime |
| `enable-network-ds-store` | Enable writing `.DS_Store` files to network shares (the default behavior) |
| `evernote` | Create a new Evernote note from stdin or a file |
| `finder-path` | Show the path to the frontmost finder window |
| `finder-selection` | Show the paths to all items selected in the Finder, quoted so it copes with spaces in your directory or file names |
| `firefox` | Force opening an URL with Firefox |
| `fix-airplay` | Kick `coreaudiod` when AirPlay stops responding |
| `focusmode-disable` | Turn off single-app mode |
| `focusmode-enable` | Turn on single-app mode |
| `get-iterm2-buffer` | Gets the current iterm2 window's scrollback contents |
| `icon-view` | Set the current directory to icon view in the Finder |
| `imgcat` | Display an image directly in your terminal. Only works with iTerm 2 |
| `itunesctl` | Play/Pause iTunes from terminal. |
| `kick-afp` | Restart file sharing from the CLI. I got tired of having to remote desktop in to kick the fileserver via the GUI every time Apple's file sharing got wedged, now it can be fixed over `ssh` |
| `kick-screensharing` | Sometimes screen sharing just hangs on my Mini running 10.11. This is not new to 10.11, it was exhibiting the same annoying behavior on 10.10 and 10.9. The mini is headless and it's a pain in the ass to plug it into the TV just long enough to restart screen sharing, so I wrote this so I can fix it over ssh. |
| `kill-screensaver` | Kill the screensaver when it locks up |
| `list-view` | Set the current directory to column view in the Finder |
| `lockscreen` | Lock the screen |
| `mac-hibernate` | Set a Mac to use hibernate mode when sleeping |
| `mac-safesleep` | Set a Mac to use safesleep mode when sleeping |
| `mac-sleep` | Set a Mac to use the default sleep mode when sleeping |
| `macos-frontmost-app` | Shows what application is Frontmost. |
| `menubar-dark` | Set the menubar to be white text on black background |
| `menubar-light` | Set the menubar to the default black text on white background style |
| `mkdmg` | Makes a .dmg file from a directory |
| `mkicns` | Creates an .icns file from an image file |
| `naptime` | Put the machine to sleep |
| `nitenite` | Make a Mac go to sleep |
| `pbcurl` | `curl` the address in the clipboard. Originally from Ryan Tomayko's [dotfiles](https://github.com/rtomayko) |
| `pbindent` | Indent the contents of the clipboard 4 spaces. With -o, write result to standard output instead of to the clipboard. Originally from Ryan Tomayko's [dotfiles](https://github.com/rtomayko) |
| `pbsed` | Run `sed`(1) on the contents of the clipboard and put the result back on the clipboard. All `sed` options and arguments are supported. Originally from Ryan Tomayko's [dotfiles](https://github.com/rtomayko) |
| `pledit` | Convert a plist to XML, run `${EDITOR}` on it, then convert it back. |
| `safari` | Force opening an URL with Safari |
| `screen-resolution` | Display the screen resolution |
| `set-macos-hostname` | Set the macOS name of your machine. macOS may be UNIX-based, but the Apple eccentricities mean that no, `sudo hostname newname` isn't enough if you want the new name to be visible on the network for things like File and Screen sharing. |
| `set-mojave-disk-warning-threshold` | Mojave now pops up a warning when you're running low on disk space. Unfortunately the threshold they pick triggers a warning every couple of minutes on my MacBook Air. This script lets you set a different number of free gigabytes to warn at. |
| `speedup-apple-mail` | Speeds up Mail.app by vaccuuming the indexes - Originally from [http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/](http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/) |
| `toggle-finder-show-dotfiles` | Toggle whether Finder shows dotfiles |
| `unquarantine` | Unquarantine a file |
| `unfuck-captive-portal` | Cope when macOs fails to render the captive portal page for joining a WIFI network by directly opening Apple's captive portal detection page with Safari. |
| `volume` | Get/set the system volume |
| `wifi-name` | Returns the name of the WIFI network you're connected to |

## Other Useful macOS tools

* [apple-touchbar](https://github.com/zsh-users/zsh-apple-touchbar) - ZSH plugin that adds support for the MacBook Pro's touchbar to iTerm2.
* [awesome-osx-command-line](https://github.com/herrbischoff/awesome-osx-command-line) documents many ways to manipulate macOS settings and applications from the command line.
* [bash-snippets](https://github.com/unixorn/Bash-Snippets) - `brew`-installable set of handy command-line tools.
* [desktoppr](https://github.com/scriptingosx/desktoppr) - A command line tool which can read and set the desktop picture.
* [Platypus](https://github.com/sveinbjornt/Platypus) - Allows you to wrap a script inside a Mac GUI wrapper.
* [sekey](https://github.com/ntrippar/sekey) - Allows you to use Touch ID / Secure Enclave for SSH Authentication.

## Installation

Tumult is packaged as a ZSH plugin to make it easier to use if you're already using a ZSH framework. If you don't already use a framework, I recommend [zgen](https://github.com/tarjoilija/zgen), because it is wicked fast and also supports using [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)'s internal plugins.

### Bash / not using a framework

If you're using `bash`, or aren't using a framework, you can either:

* Clone this repository and add its bin directory to your `$PATH`

### [Antigen](https://github.com/zsh-users/antigen)

Add `antigen bundle unixorn/tumult.plugin.zsh` to your `.zshrc` with your other bundle commands.

Antigen will handle cloning the plugin for you automatically the next time you start `zsh`. You can also add the plugin to a running ZSH with `antigen bundle unixorn/tumult.plugin.zsh` for testing before adding it to your `.zshrc`.

### [Oh-My-Zsh](http://ohmyz.sh/)

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:unixorn/tumult.plugin.zsh.git tumult`
3. Add tumult to your plugin list - edit `~.zshrc` and change `plugins=(...)` to `plugins=(... tumult)`

### [Zgen](https://github.com/tarjoilija/zgen)

Add `zgen load unixorn/tumult.plugin.zsh` to your `.zshrc` file in the same function you're doing your other `zgen load` calls in. Zgen will handle automatically cloning the plugin for you the next time you do a `zgen save`.

## License

Tumult is Apache 2.0 licensed, except for some scripts in the bin directory that have other license statements embedded inline in their source.
