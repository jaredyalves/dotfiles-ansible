#!/usr/bin/env bash

# Set the variable for the background file.
BACKGROUND_FILE="$HOME/.config/background"

# Make sure the background file is available.
if ! [ -f "$BACKGROUND_FILE" ]; then
	echo "Background file doesn't exist."
	exit 1
fi

# Use feh to change the background.
feh --no-fehbg --bg-fill "$BACKGROUND_FILE"
