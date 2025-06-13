#!/bin/bash

CFG_DIR="${XDG_CACHE_HOME:-$HOME/.config}"
BIN_DIR="${XDG_CACHE_HOME:-$HOME/.local/bin}"
SYM_DIR="/usr/bin"

for script in $(ls "$PWD/scripts"); do
    chmod +rx "$PWD/scripts/$script"
    cp "$PWD/scripts/$script" "$BIN_DIR/"
    sudo ln -fs "$BIN_DIR/$script" "$SYM_DIR/$script"
done

for config in $(ls "$PWD/config"); do
    cp -r "$PWD/config/$config" "$CFG_DIR/$config"
done

