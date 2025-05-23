#!/bin/bash
DEFAULT_STATE="powersave"
CURRENT_STATE=$DEFAULT_STATE
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
STATE_FILE="$CACHE_DIR/consciousness"
mkdir -p "$CACHE_DIR"
# If a state file exists, set it to current state.
if [ -f "$STATE_FILE" ]
then
    CURRENT_STATE_BUF=$(cat "$STATE_FILE")
    if [ "$CURRENT_STATE_BUF" == "powersave" ] || [ "$CURRENT_STATE_BUF" == "performance" ];
    then
        CURRENT_STATE="$CURRENT_STATE_BUF"
    else
        echo "$DEFAULT_STATE" > "$STATE_FILE"
    fi
else
    echo "$DEFAULT_STATE" > "$STATE_FILE"
fi
# If toggle, assume the current state is applied and change it then apply it.
# Else, apply the current state to make the above assumption true.
if [ "$1" == "toggle" ];
then
    if [ "$CURRENT_STATE" == "powersave" ];
    then
        sudo performance &> /dev/null
        if [ $? -eq 0 ];
        then
            CURRENT_STATE="performance"
        else
            notify-send -u critical "Consciousness" "Unable to set to PERFORMANCE mode."
        fi
    else
        sudo powersave &> /dev/null
        if [ $? -eq 0 ];
        then
            CURRENT_STATE="powersave"
        else
            notify-send -u critical "Consciousness" "Unable to set to POWERSAVE mode."
        fi
    fi
    echo "$CURRENT_STATE" > $STATE_FILE
else
    if [ "$CURRENT_STATE" == "powersave" ];
    then
        sudo powersave &> /dev/null
    else
        sudo performance &> /dev/null
    fi
fi
TEXT_TEXT=""
TEXT_ICON=""
TOOLTIP_TEXT=""
CLASS_NAME=""
# All this stuff is reversed for some reason.
SAVE_ICON=""
PERF_ICON=""
if [ "$CURRENT_STATE" == "powersave" ];
then
    TEXT_TEXT="Conserve"
    TEXT_ICON=$SAVE_ICON
    TOOLTIP_TEXT="CPU/GPU Conserving. Click to toggle."
    CLASS_NAME="powersave"
else
    TEXT_TEXT="Powerful"
    TEXT_ICON=$PERF_ICON
    TOOLTIP_TEXT="CPU/GPU Nominal. Click to toggle."
    CLASS_NAME="performance"
fi
printf '{"text": "%s", "tooltip": "%s", "class": "%s"}\n' "$TEXT_ICON $TEXT_TEXT" "$TOOLTIP_TEXT" "$CLASS_NAME"

