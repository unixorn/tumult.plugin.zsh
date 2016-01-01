# Tumult

## About

Tumult is an oh-my-zsh compatible plugin that adds a lot of OS X-specific functions and scripts to your environment.

Tumult will check to see if you're running on OS X and not load itself if you aren't. This allows you to use the same plugin list in all your environments without polluting your ZSH with incompatible functions and scripts on non-Mac machines.

## Included scripts

* battery-percentage
* battery-time
* clear-osx-font-cache
* column-view
* eject-all
* evernote
* finder-path
* finder-selection
* icon-view
* list-view
* lockscreen
* mkdmg
* mkicns
* osx-frontmost-app
* screen-resolution
* set-osx-hostname
* volume
* wifi-name

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
