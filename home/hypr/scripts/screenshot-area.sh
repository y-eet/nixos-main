#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$HOME/Pictures/Screenshots"
file="$HOME/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
grim -g "$(slurp)" "$file"
wl-copy < "$file"
notify-send "Screenshot saved" "$file"
