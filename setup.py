#!/usr/bin/env python
#
# Tumult
#
# Copyright 2015-2017 Joe Block <jpb@unixorn.net>
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
#
"""
setup.py for tumult
"""

import os
import shutil
import subprocess
from setuptools import setup, find_packages, Command


def systemCall(command):
  """Run a command and return stdout.

  Would be better to use subprocess.check_output, but this works on 2.6,
  which is still the system Python on CentOS 7.
  """
  p = subprocess.Popen([command], stdout=subprocess.PIPE, shell=True)
  return p.stdout.read()


name = "tumult"
version = "0.2.%s" % (systemCall('git rev-list HEAD --count').strip())


class CleanCommand(Command):
  """
  Add a clean option to setup.py's commands
  """
  description = 'Clean up'
  user_options = []


  def initialize_options(self):
    self.cwd = None


  def finalize_options(self):
    self.cwd = os.getcwd()


  def run(self):
    assert os.getcwd() == self.cwd, "Must be in package root: %s" % self.cwd
    if os.path.isdir('build'):
      shutil.rmtree('build')
    if os.path.isdir('dist'):
      shutil.rmtree('dist')



setup(
  name=name,
  author="Joe Block",
  author_email="jpb@unixorn.net",
  description="Tumult is a collection of utility scripts for OS X",
  url="https://github.com/unixorn/tumult.plugin.zsh",
  packages=find_packages(),
  install_requires=[],
  cmdclass={
    "clean": CleanCommand,
  },
  version=version,
  scripts=[
    'bin/720p',
    'bin/ask-password',
    'bin/battery-percentage',
    'bin/battery-time',
    'bin/change-wallpaper',
    'bin/chrome',
    'bin/chrome-tabs',
    'bin/clean-clipboard',
    'bin/clean-xml-clip',
    'bin/clear-macos-font-cache',
    'bin/clear-osx-font-cache',
    'bin/clip',
    'bin/column-view',
    'bin/disable-ftp-server',
    'bin/disable-ssh-server',
    'bin/disable-startup-chime',
    'bin/eject-all',
    'bin/enable-ftp-server',
    'bin/enable-ssh-server',
    'bin/enable-startup-chime',
    'bin/evernote',
    'bin/finder-path',
    'bin/finder-selection',
    'bin/firefox',
    'bin/fix-airplay',
    'bin/get-iterm2-buffer',
    'bin/icon-view',
    'bin/imgcat',
    'bin/install-latest-chrome',
    'bin/itunesctl',
    'bin/kick-afp',
    'bin/kick-screensharing',
    'bin/kill-screensaver',
    'bin/list-view',
    'bin/lockscreen',
    'bin/mac-hibernate',
    'bin/mac-safesleep',
    'bin/mac-sleep',
    'bin/mac-smartsleep',
    'bin/macos-frontmost-app',
    'bin/mkdmg',
    'bin/mkicns',
    'bin/mute',
    'bin/naptime',
    'bin/nitenite',
    'bin/osx-frontmost-app',
    'bin/pbcurl',
    'bin/pbindent',
    'bin/pbsed',
    'bin/pledit',
    'bin/randomize-mac-address',
    'bin/reindex-spotlight',
    'bin/safari',
    'bin/screen-resolution',
    'bin/set-macos-hostname',
    'bin/set-osx-hostname',
    'bin/speedup-apple-mail',
    'bin/toggle-finder-show-dotfiles',
    'bin/toggle-ssh',
    'bin/unmute',
    'bin/unquarantine',
    'bin/volume',
    'bin/wifi-name',
    'bin/wifi-signal-strength',
  ],
  download_url="https://github.com/unixorn/tumult.plugin.zsh/tarball/%s" % version,
  classifiers=[
    "Development Status :: 3 - Alpha",
    "Operating System :: POSIX",
    "License :: OSI Approved :: Apache Software License",
    "Programming Language :: Python :: 2.7",
    "Topic :: System :: Systems Administration",
  ],
  keywords=['macos', 'osx', 'os x'],
)
