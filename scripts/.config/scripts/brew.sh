#!/bin/bash

if ! type "brew" > /dev/null; then
	echo "you need to install homebrew and configure your PATH before running the script"
fi

# raycast
# enables assigning hotkeys to apps
# and basic window management
# plus a host of other useful features
brew install --cask raycast

# kitty terminal
brew install --cask kitty

# stow for dotfiles
brew install stow

# lazygit git manager
brew install lazygit

# neovim
brew install neovim

# neovim-remote
# used to allow opening of files 
# through lazygit into the current 
# neovim instance
brew install neovim-remote

# github cli
brew install gh

# php
brew install php

# node
brew install node

# nerd fonts symbols
# we install symbols only as kitty terminal can
# patch our current font automatically to use them
brew tap homebrew/cask-fonts
brew install font-symbols-only-nerd-font

# fzf fuzzy finder
# great overall tool and also used within nvims telescope plugin
brew install fzf
$(brew --prefix)/opt/fzf/install

# ripgrep
brew install ripgrep

# racket
brew install --cask racket

# java
brew install java

# fd for faster find
brew install fd

# elixir
brew install elixir
