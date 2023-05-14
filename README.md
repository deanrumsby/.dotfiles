# .dotfiles

## Installation
My dotfiles are managed using [GNU Stow](https://www.gnu.org/software/stow/), which is easily installed for macOS via Homebrew:

`brew install stow`

then...

- clone this repo into your home directory
- `cd ~/.dotfiles`
- `stow <package>` where `<package>` is one of the root directories of the repo.

Stow will create the necessary symlinks for a package within your home directory, thus any conflicting files will need to be moved/deleted before you can successfully run the command.

## To Do
Currently, the configuration of my macOS keyboard shortcuts is not automated, so I need to learn how to automate this.
