# Bash completions for tumult plugin scripts
# https://github.com/unixorn/tumult.plugin.zsh

_tumult_applications() {
  local apps
  apps=$(find /Applications -maxdepth 2 -name '*.app' -exec basename {} .app \; 2>/dev/null)
  COMPREPLY=($(compgen -W "$apps" -- "${COMP_WORDS[COMP_CWORD]}"))
}

_tumult_files() {
  COMPREPLY=($(compgen -f -- "${COMP_WORDS[COMP_CWORD]}"))
}

_tumult_directories() {
  COMPREPLY=($(compgen -d -- "${COMP_WORDS[COMP_CWORD]}"))
}

_tumult_image_files() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -f -X '!*.@(png|jpg|jpeg|gif|bmp|tiff|webp|svg|ico|heic|PNG|JPG|JPEG|GIF|BMP|TIFF|WEBP|SVG|ICO|HEIC)' -- "$cur"))
  # Also include directories for navigation
  COMPREPLY+=($(compgen -d -- "$cur"))
}

_tumult_pdf_files() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -f -X '!*.@(pdf|PDF)' -- "$cur"))
  COMPREPLY+=($(compgen -d -- "$cur"))
}

_tumult_plist_files() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -f -X '!*.@(plist|PLIST)' -- "$cur"))
  COMPREPLY+=($(compgen -d -- "$cur"))
}

_tumult_markdown_files() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -f -X '!*.@(md|markdown|txt|MD|MARKDOWN|TXT)' -- "$cur"))
  COMPREPLY+=($(compgen -d -- "$cur"))
}

# 720p - resize app to 720p
_720p() {
  _tumult_applications
}

# bundle-id - print bundle ID of an application
_bundle_id() {
  _tumult_applications
}

# dump-entitlements - dump binary entitlements
_dump_entitlements() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $COMP_CWORD -eq 1 ]]; then
    COMPREPLY=($(compgen -W "find dump sort help" -- "$cur"))
  fi
}

# google - search Google
_google() {
  COMPREPLY=()
}

# hide-file / unhide-file
_hide_file() {
  _tumult_files
}

# imgcat - display images inline in iTerm2
_imgcat() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local prev="${COMP_WORDS[COMP_CWORD-1]}"

  case "$prev" in
    -W|--width|-H|--height)
      COMPREPLY=($(compgen -W "auto 50 100 200 250 500 50% 100%" -- "$cur"))
      return
      ;;
    -t|--type)
      COMPREPLY=($(compgen -W "image/png image/jpeg image/gif application/json text/markdown" -- "$cur"))
      return
      ;;
  esac

  if [[ "$cur" == -* ]]; then
    COMPREPLY=($(compgen -W "-h --help -p --print -n --no-print -W --width -H --height -r --preserve-aspect-ratio -s --stretch -f --file -u --url -t --type" -- "$cur"))
  else
    _tumult_image_files
  fi
}

# itunesctl - control iTunes
_itunesctl() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $COMP_CWORD -eq 1 ]]; then
    COMPREPLY=($(compgen -W "play pause mute unmute next prev" -- "$cur"))
  fi
}

# keychainctl - manage keychain secrets
_keychainctl() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $COMP_CWORD -eq 1 ]]; then
    COMPREPLY=($(compgen -W "get set rm ls lock" -- "$cur"))
  fi
}

# macos-alert / mac-alert
_macos_alert() {
  COMPREPLY=()
}

# macos-notification / mac-notification
_macos_notification() {
  COMPREPLY=()
}

# make-ramdisk
_make_ramdisk() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local prev="${COMP_WORDS[COMP_CWORD-1]}"

  case "$prev" in
    --ram-disk-name|--ramdisk-name)
      COMPREPLY=()
      return
      ;;
    --ram-disk-size|--ramdisk-size)
      COMPREPLY=($(compgen -W "64 128 256 512 1024 2048 4096" -- "$cur"))
      return
      ;;
  esac

  if [[ "$cur" == -* ]]; then
    COMPREPLY=($(compgen -W "--help --ram-disk-name --ramdisk-name --ram-disk-size --ramdisk-size" -- "$cur"))
  fi
}

# manpreview / manp
_manpreview() {
  COMPREPLY=($(compgen -c -- "${COMP_WORDS[COMP_CWORD]}"))
}

# markdown-open
_markdown_open() {
  _tumult_markdown_files
}

# mergepdfs
_mergepdfs() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [[ "$prev" == "-o" ]]; then
    _tumult_pdf_files
  else
    if [[ "$cur" == -* ]]; then
      COMPREPLY=($(compgen -W "-o" -- "$cur"))
    else
      _tumult_pdf_files
    fi
  fi
}

# mkdmg - create a DMG
_mkdmg() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $COMP_CWORD -eq 2 ]]; then
    _tumult_directories
  fi
}

# mkicns - create icns from image
_mkicns() {
  _tumult_image_files
}

# pbsed / pb-sed
_pbsed() {
  COMPREPLY=()
}

# pledit - edit plist files
_pledit() {
  _tumult_plist_files
}

# quicklook
_quicklook() {
  _tumult_files
}

# screencap-stream
_screencap_stream() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local prev="${COMP_WORDS[COMP_CWORD-1]}"

  case "$prev" in
    -i)
      COMPREPLY=($(compgen -W "0.01 0.05 0.1 0.25 0.5 1" -- "$cur"))
      return
      ;;
    -o)
      COMPREPLY=($(compgen -f -X '!*.mp4' -- "$cur"))
      return
      ;;
    -t)
      _tumult_directories
      return
      ;;
  esac

  if [[ "$cur" == -* ]]; then
    COMPREPLY=($(compgen -W "-i -k -o -t" -- "$cur"))
  fi
}

# set-cursor-size
_set_cursor_size() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "1 1.5 2 2.5 3 3.5 4" -- "$cur"))
}

# set-macos-hostname / set-osx-hostname
_set_macos_hostname() {
  COMPREPLY=()
}

# set-mojave-disk-warning-threshold
_set_mojave_disk_warning_threshold() {
  COMPREPLY=()
}

# set-software-update-interval
_set_software_update_interval() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "1 3 7 14 30" -- "$cur"))
}

# set-time-machine-interval
_set_time_machine_interval() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "1800 3600 7200 14400 43200 86400" -- "$cur"))
}

# set-wallpaper
_set_wallpaper() {
  _tumult_image_files
}

# unquarantine
_unquarantine() {
  _tumult_files
}

# volume
_volume() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "0 10 20 30 40 50 60 70 80 90 100" -- "$cur"))
}

# wifi
_wifi() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "on off" -- "$cur"))
}

# Register completions
complete -F _720p 720p
complete -F _bundle_id bundle-id
complete -F _dump_entitlements dump-entitlements
complete -F _hide_file hide-file
complete -F _hide_file unhide-file
complete -F _hide_file unquarantine
complete -F _imgcat imgcat
complete -F _itunesctl itunesctl
complete -F _keychainctl keychainctl
complete -F _macos_alert macos-alert
complete -F _macos_alert mac-alert
complete -F _macos_notification macos-notification
complete -F _macos_notification mac-notification
complete -F _make_ramdisk make-ramdisk
complete -F _manpreview manpreview
complete -F _manpreview manp
complete -F _markdown_open markdown-open
complete -F _mergepdfs mergepdfs
complete -F _mkdmg mkdmg
complete -F _mkicns mkicns
complete -F _pbsed pbsed
complete -F _pbsed pb-sed
complete -F _pledit pledit
complete -F _quicklook quicklook
complete -F _screencap_stream screencap-stream
complete -F _set_cursor_size set-cursor-size
complete -F _set_macos_hostname set-macos-hostname
complete -F _set_macos_hostname set-osx-hostname
complete -F _set_mojave_disk_warning_threshold set-mojave-disk-warning-threshold
complete -F _set_software_update_interval set-software-update-interval
complete -F _set_time_machine_interval set-time-machine-interval
complete -F _set_wallpaper set-wallpaper
complete -F _volume volume
complete -F _wifi wifi

# Commands that just take generic file arguments
complete -F _tumult_files clip
complete -F _tumult_files quicklook
