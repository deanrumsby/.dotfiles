#!/bin/bash

if ! type "cargo" > /dev/null; then
	echo "you need to install cargo and configure your PATH before running the script"
fi

# wasm-pack
cargo install wasm-pack
