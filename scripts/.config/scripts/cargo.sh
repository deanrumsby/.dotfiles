#!/bin/zsh

if ! type "cargo" > /dev/null; then
	echo "you need to install cargo and configure your PATH before running the script"
fi

# stylua opinionated lua formatter
cargo install stylua

# wasm-pack
cargo install wasm-pack
