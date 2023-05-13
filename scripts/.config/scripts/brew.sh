#!/bin/zsh

if ! type "brew" > /dev/null; then
	echo "you need to install homebrew and configure your PATH before running the script"
fi

# raycast
brew install --cask raycast

# kitty terminal
brew install --cask kitty

# stow for dotfiles
brew install stow

# lazygit git manager
brew install lazygit

# neovim
brew install neovim

# github cli
brew install gh

# node
brew install node

# nerd fonts symbols
brew tap homebrew/cask-fonts
brew install font-symbols-only-nerd-font

# fzf fuzzy finder
brew install fzf
$(brew --prefix)/opt/fzf/install

# ripgrep
brew install ripgrep
