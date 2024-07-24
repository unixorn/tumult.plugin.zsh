# Copyright 2015-2024 Joseph Block <jpb@unixorn.net>
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
  # Add our plugin's bin directory to user's path
  path+=("${0:h}/bin")


  # Check if a command exists
  has() {
    which "$@" > /dev/null 2>&1
  }

  if has brew; then
      if has groovy; then
          export GROOVY_HOME="$(brew --prefix groovy)/libexec"
      fi

      if has go; then
          path=($path "$(brew --prefix go)/bin")
      fi

      if has npm; then
          path=($path /usr/local/share/npm/bin)
      fi
  fi

  alias -g @NDL='~/Downloads/*(.om[1])'

  alias eject="diskutil eject"
  alias flushdns="dscacheutil -flushcache"
  alias flushds="dscacheutil -flushcache"
  alias kickdns="dscacheutil -flushcache"
  alias top='TERM=vt100 top'
  alias reveal='open --reveal'

  # Quicklook and Spotlight
  alias ql='qlmanage -p'
  alias spotlighter='mdfind -onlyin `pwd`'

  # Clipboard manipulation
  alias gpaste="pbpaste | perl -pe 's/\r\n|\r/\n/g'"

  # Add DS_Store to files ignored during completion
  fignore=(DS_Store "${fignore}")

  # Aliases for things renamed as they were extracted into scripts
  alias cleanxmlclip='clean-xml-clip'
  alias killScreenSaver='kill-screensaver'
  alias killSS='kill-screensaver'
  alias mywireless="wifi-name"

  # Apple has some useful stuff in places outside $PATH, so add aliases.
  if [ -x '/System/Library/CoreServices/Applications/Network Utility.app/Contents/Resources/stroke' ]; then
    alias stroke='/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke'
  fi

  if [ -x '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport' ]; then
    alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
  fi

  if has FileMerge; then
    alias filemerge='open -a FileMerge'
  fi

  if [[ ! -f /var/db/locate.database ]]; then
    if [[ has(launchctl) ]]; then
      if [[ -f /System/Library/LaunchDaemons/com.apple.locate.plist ]]; then
        alias updatedb='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist'
      fi
    else
      alias updatedb='sudo updatedb'
    fi
  else
    if [[ -x /usr/libexec/locate.updatedb ]]; then
      alias updatedb='sudo /usr/libexec/locate.updatedb'
    fi
  fi

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

  if [[ -z "$EDITOR" ]]; then
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

    # If they put a vim build in /usr/local/bin, they want to use that.
    if [ -x /usr/local/bin/vim ]; then
      alias vim='/usr/local/bin/vim'
      alias vi="/usr/local/bin/vim"
      export EDITOR="/usr/local/bin/vim"
    fi
  fi
  if [[ -z "$VISUAL" ]]; then
    export VISUAL=${EDITOR}
  fi

  # Old-school OS9 and early Mac text files had a different line ending than
  # *nix, deal with converting back and forth.
  alias mac2unix="tr '\015' '\012'"
  alias unix2mac="tr '\012' '\015'"

  mighty-mouse-battery() {
    ioreg -n "AppleBluetoothHIDMouse" | grep -i "batterypercent" | sed 's/[^[:digit:]]//g'
  }

  # Deal with staleness in macOS userland.
  # Apple never seems to be very current with the versions of things in userland, so
  # we're going to set up some aliases to force user-installed versions of programs to
  # override the stale versions in /usr.

  # MySQL
  # Use local versions if present
  if [ -x /usr/local/bin/mysql/bin/mysql ]; then
    alias mysql="/usr/local/mysql/bin/mysql"
  fi

  if [ -x /usr/local/bin/mysql/bin/mysqladmin ]; then
    alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
  fi

  if has brew; then
    # homebrew alias setup
    BREW_PREFIX=$(brew --prefix)

    # We prefer to use the brew installed versions of things when
    # they're present
    if [[ -x "$BREW_PREFIX/bin/memached" ]]; then
      alias memcached="${BREW_PREFIX}/bin/memcached"
      alias memcached-load="brew services start memcached"
      alias memcached-unload="brew services stop memcached"
    fi

    if [[ -x "$BREW_PREFIX/bin/mysqladmin" ]]; then
      alias mysqladmin="${BREW_PREFIX}/bin/mysqladmin"
    fi

    if [[ -x "$BREW_PREFIX/bin/mysql" ]]; then
      alias mysql="${BREW_PREFIX}/bin/mysql"
      alias mysql-load="brew services start mysql"
      alias mysql-unload="brew services stop mysql"
    fi

    if [[ -x "$BREW_PREFIX/bin/pg_ctl" ]]; then
      alias pg_ctl="${BREW_PREFIX}/bin/pg_ctl"
      alias postgres-load="brew services start postgresql"
      alias postgres-unload="brew services stop postgresql"
    fi

    # Use brew vim when present since it gets updated more frequently
    if [[ -z "$EDITOR" ]]; then
      if [[ -x "${BREW_PREFIX}/bin/vim" ]]; then
        alias vim="${BREW_PREFIX}/bin/vim"
        alias vi="${BREW_PREFIX}/bin/vim"
        export EDITOR="${BREW_PREFIX}/bin/vim"
        if [[ -z "$VISUAL" ]]; then
          export VISUAL="${EDITOR}"
        fi
      fi
    fi

    unset BREW_PREFIX
  fi
fi
