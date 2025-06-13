CFG_DIR="${XDG_CACHE_HOME:-$HOME/.config}"
BIN_DIR="${XDG_CACHE_HOME:-$HOME/.local/bin}"
SYM_DIR="/usr/bin"

for config in $(ls "$PWD/config"); do
    read -p "Updating folders for $config, are you sure? " -n 1 -r
    echo    
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        cp -r "$PWD/config/$config" "$CFG_DIR/$config"
        # do dangerous stuff
    fi
done

git add . && git commit -m "Updated on $(date)." && git push origin main

