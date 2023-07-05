
# Contributing to tumult

**tumult** is a collection of helper scripts for macOS.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Contribution Guidelines](#contribution-guidelines)
- [To add a helper script](#to-add-a-helper-script)
- [To remove a script](#to-remove-a-script)
- [Scripts are preferred over aliases and functions](#scripts-are-preferred-over-aliases-and-functions)
- [Update the ReadMe with your contribution](#update-the-readme-with-your-contribution)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Contribution Guidelines

Please only add scripts that have a license attached. I'd prefer to avoid the gray area of unlicensed code.
## To add a helper script

Submit a pull request. Please use `#!/usr/bin/env interpreter` instead of a direct path to the interpreter, this makes it easier for people to use more recent versions since the ones packaged macOS are usually  stale.

## To remove a script

All of the scripts here were either written by me, copied from blog posts or had an Open Source license. That said, if you wrote something included here and want it removed, either open an issue to discuss the removal or submit a pull request.

## Scripts are preferred over aliases and functions

I'd like this collection to work for non-ZSH users, as well as people who are not using frameworks with their ZSH setup. To make that easier, instead of adding functions and aliases to `tumult.plugin.zsh`, make them standalone scripts if possible.

## Update the ReadMe with your contribution

Please include an entry in the **Included Scripts** section of `README.md` for any scripts in your PRs so authors get their work credited correctly. Add a link to the source in the comments at the beginning of your script so people can find their other work, and please keep the script descriptions in alphabetical order by script name.
