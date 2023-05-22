#!/bin/zsh

if ! type "pip3" > /dev/null; then
	echo "you need to install pip and configure your PATH before running the script"
fi

# python formatter
pip3 install black
