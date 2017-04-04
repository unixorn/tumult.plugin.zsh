# Copyright 2015-2016 Joseph Block <jpb@apesseekingknowledge.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# All of this stuff is macOS-specific, so if we're not on Darwin, bail out
# gracefully.
#
# This makes it easier to use the same plugin list on both Linux and macOS
# without polluting your Linux environment with functions and files that
# will fail.

if [[ "$(uname -s)" = "Darwin" ]]; then
  # Add our plugin's bin diretory to user's path
  PLUGIN_BIN="$(dirname $0)/bin"
  export PATH=${PATH}:${PLUGIN_BIN}

  alias -g @NDL='~/Downloads/*(.om[1])'

  alias eject="diskutil eject"
  alias flushdns="dscacheutil -flushcache"
  alias flushds="dscacheutil -flushcache"
  alias kickdns="dscacheutil -flushcache"
  alias mywireless="system_profiler SPAirPortDataType | awk -F\": \" '/Current Wireless Network/{print $2}'"
  alias open_dot='dot -Tpng | open -f -a preview'
  alias top='TERM=vt100 top'
  alias reveal='open --reveal'

  # Quicklook and Spotlight
  alias ql='qlmanage -p'
  alias quicklook='qlmanage -p'
  alias spotlighter='mdfind -onlyin `pwd`'

  # Clipboard manipulation
  alias gpaste="pbpaste | perl -pe 's/\r\n|\r/\n/g'"
  alias pbclean="pbpaste | perl -pe 's/\r\n|\r/\n/g' | pbcopy"
  alias pbsort="pbpaste | sort | pbcopy"

  # `wifi on` to turn wifi on, and `wifi off` to turn it off
  alias wifi="networksetup -setairportpower $(networksetup -listallhardwareports | grep -A 2 'Hardware Port: Wi-Fi' | grep 'Device:' | awk '{print $2}')"

  # Add DS_Store to files ignored during completion
  fignore=(DS_Store $fignore)

  # Aliases for things renamed as they were extracted into scripts
  alias cleanxmlclip='clean-xml-clip'
  alias killScreenSaver='kill-screensaver'
  alias killSS='kill-screensaver'

  # Sublime
  if [[ -x /usr/local/bin/subl ]]; then
    alias s='/usr/local/bin/subl'
  fi

  # Show/hide hidden files in Finder
  alias show-dotfiles="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
  alias hide-dotfiles="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

  # Hide/show all desktop icons for presenting
  alias show-desktop-icons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
  alias hide-desktop-icons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

  # sound
  alias stfu="osascript -e 'set volume output muted true'"

  if [ -x '/System/Library/CoreServices/Applications/Network Utility.app/Contents/Resources/stroke' ]; then
    alias stroke='/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke'
  fi

  if [ -x '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport' ]; then
    alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
  fi

  # macOS has a habit of changing the way it does some of its non-posixy things
  # every major rev or so. Add a helper to standardize detecting the rev
  function macos-major-version() {
    sw_vers -productVersion | awk -F '.' '{print $1 "." $2}'
  }

  # Don't break Tumult backward compatibility
  function osx-major-version() {
    sw_vers -productVersion | awk -F '.' '{print $1 "." $2}'
  }

  # Merge PDF files
  # Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
  alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

  # Deal with some things macOS userland is missing

  # Canonical hex dump; some systems have this symlinked
  command -v hd > /dev/null || \
    command -v hexdump > /dev/null && \
    alias hd="hexdump -C"

  # macOS has no `md5sum`, so use `md5` as a fallback if it hasn't been
  # been installed with brew/macports/fink
  command -v md5sum > /dev/null || \
    command -v md5 > /dev/null && \
    alias md5sum=$(which md5)

  # macOS has no `sha1sum`, so use `shasum` as a fallback if it hasn't been
  # been installed with brew/macports/fink
  command -v sha1sum > /dev/null || \
    command -v shasum > /dev/null && \
    alias sha1sum=$(which shasum)

  # Deal with staleness in macOS userland.
  # Apple never seems to be very current with the versions of things in userland, so
  # we're going to set up some aliases to force user-installed versions of programs to
  # override the stale versions in /usr.

  # MySQL
  # Use homebrew versions if present
  if [ -x /usr/local/bin/mysql/bin/mysql ]; then
    alias mysql="/usr/local/mysql/bin/mysql"
  fi

  if [ -x /usr/local/bin/mysql/bin/mysqladmin ]; then
    alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
  fi

  # Sue me, I like vim. Got tired of different *nix stuffing it in different
  # places, so go through the usual suspects and create an alias when we find
  # it.
  if [ -x /bin/vim ]; then
    alias vi="/bin/vim"
    alias vim="/bin/vim"
    export EDITOR='/bin/vim'
  fi

  if [ -x /usr/bin/vim ]; then
    alias vi="/usr/bin/vim"
    alias vim="/usr/bin/vim"
    export EDITOR='/usr/bin/vim'
  fi

  # If they installed with macports, it is definitely more current than the stock
  # Apple vim
  if [ -x /opt/local/bin/vim ]; then
    alias vim='/opt/local/bin/vim'
    alias vi="/opt/local/bin/vim"
    export EDITOR='/opt/local/bin/vim'
  fi

  # Same for homebrew.
  if [ -x /usr/local/bin/vim ]; then
    alias vim='/usr/local/bin/vim'
    alias vi="/usr/local/bin/vim"
    export EDITOR="/usr/local/bin/vim"
  fi

  export VISUAL=${EDITOR}

  # Old-school OS9 and early Mac text files had a different line ending than
  # *nix, deal with converting back and forth.
  alias mac2unix="tr '\015' '\012'"
  alias unix2mac="tr '\012' '\015'"

  # Zap those damn .DS_Store files
  zap-ds-store() {
    if [ -d "${1}" ]; then
      find "${1}" -type f -name '.DS_Store' -delete -ls
    fi
  }

  mighty-mouse-battery() {
    ioreg -n "AppleBluetoothHIDMouse" | grep -i "batterypercent" | sed 's/[^[:digit:]]//g'
  }

  manp() {
    man -t $* | ps2pdf - - | open -f -a Preview
  }

  # homebrew stuff
  if [ -f /usr/local/Cellar/memcached/1.4.24/homebrew.mxcl.memcached.plist ]; then
    alias memcached-load="launchctl load -w /usr/local/Cellar/memcached/1.4.24/homebrew.mxcl.memcached.plist"
    alias memcached-unload="launchctl unload -w /usr/local/Cellar/memcached/1.4.24/homebrew.mxcl.memcached.plist"
  fi

  if [ -f /usr/local/Cellar/mysql/5.7.17/homebrew.mxcl.mysql.plist ]; then
    alias mysql-load="launchctl load -w /usr/local/Cellar/mysql/5.7.17/homebrew.mxcl.mysql.plist"
    alias mysql-unload="launchctl unload -w /usr/local/Cellar/mysql/5.7.17/homebrew.mxcl.mysql.plist"
  fi

  if [ -f /usr/local/Cellar/postgresql/9.6.2/homebrew.mxcl.postgresql.plist ]; then
    alias postgres-load="launchctl load -w /usr/local/Cellar/postgresql/9.6.2/homebrew.mxcl.postgresql.plist"
    alias postgres-unload="launchctl unload -w /usr/local/Cellar/postgresql/9.6.2/homebrew.mxcl.postgresql.plist"
  fi

fi
