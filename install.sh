#!/bin/bash

CFG_DIR="${XDG_CACHE_HOME:-$HOME/.config}"
BIN_DIR="${XDG_CACHE_HOME:-$HOME/.local/bin}"
SYM_DIR="/usr/bin"

for script in $(ls "$PWD/scripts"); do
    sudo chmod +rx "$PWD/scripts/$script"
    cp -rf "$PWD/scripts/$script" "$BIN_DIR/"
    sudo ln -fs "$PWD/scripts/$script" "$SYM_DIR/$script"
done

for config in $(ls "$PWD/config"); do
    rm -rf "$CFG_DIR/$config"
    sudo ln -snf "$PWD/config/$config" "$CFG_DIR/$config"
done


