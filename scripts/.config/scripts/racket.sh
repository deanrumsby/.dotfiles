#!/bin/zsh

if ! type "raco" > /dev/null; then
	echo "you need to install raco (racket) and configure your PATH before running the script"
fi

# racket lsp
raco pkg install racket-langserver

# racket formatter
raco pkg install fmt
