#!/usr/bin/env bash

lock_file="/tmp/screensaver.lock"

if [ -e "$lock_file" ]; then
    echo "Script is already running."
    exit 1
fi

touch "$lock_file"

cleanup() {
    rm -f "$lock_file"
}

trap cleanup EXIT

xset dpms 0 0 0
xset s noblank

while true; do
    timeout=$(xssstate -t)

    if [ "$timeout" -lt 61000 ] && [ "$timeout" -gt 59000 ]; then
        dunstify "Screen Lock" "Screen is locking in 60 seconds."
	sleep 5
    fi

    if [ "$timeout" -lt 11000 ] && [ "$timeout" -gt 9000 ]; then
        dunstify "Screen Lock" "Screen is locking in 10 seconds."
	sleep 5
    fi

    if [ "$timeout" -eq 0 ]; then
        slock &
	xset dpms force off
    fi

    sleep 1
done
