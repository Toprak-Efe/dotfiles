#!/bin/bash

SCRIPTS_DIR="scripts"
BIN_DIR="${XDG_CACHE_HOME:-$HOME/.local/bin}"
SYM_DIR="/usr/bin"

for filepath in "$PWD/$SCRIPTS_DIR"/*; do
    filename=$(basename "$filepath")
    chmod +rx "$filepath"
    cp "$filepath" "$BIN_DIR/"
    sudo ln -fs "$BIN_DIR/$filename" "$SYM_DIR/$filename"
done

