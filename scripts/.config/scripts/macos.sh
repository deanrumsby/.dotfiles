#!/bin/bash

# install xcode cli tools
xcode-select --install

# only display open apps in dock
defaults write com.apple.dock "static-only" -bool "true"

# autohide dock
defaults write com.apple.dock "autohide" -bool "true"

# restart affected services
killall Dock;
