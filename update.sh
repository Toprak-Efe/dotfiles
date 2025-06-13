CFG_DIR="${XDG_CACHE_HOME:-$HOME/.config}"
BIN_DIR="${XDG_CACHE_HOME:-$HOME/.local/bin}"
SYM_DIR="/usr/bin"

for config in $(ls "$PWD/config"); do
    cp -r "$PWD/config/$config" "$CFG_DIR/$config"
done

git add . && git commit -m "Updated on $(date)." && git push origin main

