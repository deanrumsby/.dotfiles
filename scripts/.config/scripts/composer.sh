#!/bin/zsh

if ! type "composer" > /dev/null; then
	echo "you need to install composer and configure your PATH before running the script"
fi

# phpcs and phpcbf
composer global require "squizlabs/php_codesniffer=*"
