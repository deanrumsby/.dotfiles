#!/bin/zsh

if ! type "cargo" > /dev/null; then
	echo "you need to install cargo and configure your PATH before running the script"
fi

# stylua opinionated lua formatter
cargo install stylua

# wasm-pack
cargo install wasm-pack

# useful for creating UF2 images for the RP2040 USB Bootloader
cargo install elf2uf2-rs --locked

# useful for flashing over the SWD pins using a supported JTAG probe
cargo install probe-run
