# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [2026.8.17]

### Added

- Zsh completions for all bin/ scripts with descriptions (completions/_tumult)
- Bash completions for scripts that accept arguments (completions/tumult.bash)
- `battery-prompt --raw` flag for standalone terminal use (plain ANSI, no zsh prompt wrappers)

### Changed

- `bin/battery-prompt`: refactored to use functions, type hints, docstrings,
  `subprocess.run`, named constants, input validation, and error handling
- `bin/pb`: refactored to use `main()` function, type hints, docstrings,
  and ImportError handling for missing gitlike-commands dependency
- `tumult.plugin.zsh`: added completions directory to fpath

### Fixed

- `bin/battery-prompt`: stricter ioreg matching avoids false matches inside
  nested BatteryData dictionaries on newer macOS versions
