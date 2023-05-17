#!/bin/zsh

if ! type "npm" > /dev/null; then
	echo "you need to install node + npm and configure your PATH before running the script"
fi

# eslint_d javascript/ typescript linter
npm install -g eslint_d
