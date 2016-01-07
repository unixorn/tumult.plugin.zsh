# Copyright 2015 Joseph Block <jpb@apesseekingknowledge.net>
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

# All of this stuff is OSX-specific, so if we're not on Darwin, bail out
# gracefully.
#
# This makes it easier to use the same plugin list on both Linux and OS X
# without polluting your Linux environment with functions and files that
# will fail.

if [[ "$(uname -s)" = "Darwin" ]]; then
  # Add our plugin's bin diretory to user's path
  PLUGIN_BIN="$(dirname $0)/bin"
  export PATH=${PATH}:${PLUGIN_BIN}

  alias eject="diskutil eject"
  alias flushds="dscacheutil -flushcache"

  killSS() {
    kill -9 $(ps ww | \
      grep ScreenSaverEngine | \
      grep -v grep | \
      awk "{print $1}")
  }

  alias top='TERM=vt100 top'

  # Quicklook and Spotlight
  alias ql='qlmanage -p'
  alias quicklook='qlmanage -p'
  alias spotlighter='mdfind -onlyin `pwd`'

  # Clipboard manipulation
  alias gpaste="pbpaste | perl -pe 's/\r\n|\r/\n/g'"
  alias pbclean="pbpaste | perl -pe 's/\r\n|\r/\n/g' | pbcopy"
  alias pbsort="pbpaste | sort | pbcopy"

  cleanxmlclip() {
    pbpaste | tidy -xml -wrap 0 | pbcopy
  }

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

  function pledit() { # plist editor.
    if [ $# -ne 1 ]; then
      echo -e "pledit: Edit Apple plist file\nusage: pledit plist_filename"
    else
      sudo plutil -convert xml1 "${1}"; # convert the binary file to xml
      sudo "${EDITOR}" "${1}"; # use the default editor
      sudo plutil -convert binary1 "${1}" # convert it back to binary
    fi
  }

  # Manually remove a downloaded app or file from the quarantine
  function unquarantine() {
    for attribute in com.apple.metadata:kMDItemDownloadedDate com.apple.metadata:kMDItemWhereFroms com.apple.quarantine; do
      xattr -r -d "$attribute" "$@"
    done
  }

  # OS X has a habit of changing the way it does some of its non-posixy things
  # every major rev or so. Add a helper to standardize detecting the rev
  function osx-major-version() {
    sw_vers -productVersion | awk -F '.' '{print $1 "." $2}'
  }

  # Deal with staleness in OS X userland.
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

  # Old-school OS9 Mac text files had a different line ending than *nix, deal with
  # converting back and forth.
  alias mac2unix="tr '\015' '\012'"
  alias unix2mac="tr '\012' '\015'"

  # Zap those damn .DS_Store files
  zap-ds-store() {
    if [ -d "${1}" ]; then
      find "${1}" -type f -name '.DS_Store' -delete -ls
    fi
  }

  # Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
  # tool that makes it easy to customize your color scheme and keep them in sync
  # across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/

  export LSCOLORS=exfxcxdxbxegedAbAgacad
  export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=1;;41:sg=1;;46:tw=0;42:ow=0;43:"
fi
