#!/bin/bash

set -e
curMousePos=$(xdotool getmouselocation 2>&1)
for p in $(seq 0 2 100); do
    [[ $(xdotool getmouselocation 2>&1) != $curMousePos ]] && exit 1
    dunstify --icon preferences-desktop-screensaver \
        -h int:value:$p \
        -h 'string:hlcolor:#f38ba8' \
        -h string:x-dunst-stack-tag:progress-lock \
        --timeout=500 "Locking screen in 5s..." "Move or use corners to prevent the screen from locking."
    sleep 0.05
done
