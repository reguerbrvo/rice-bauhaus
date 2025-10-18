#! /bin/bash

VAR=$(cat /home/marseille/.config/polybar/scripts/ip/ip.txt)
echo "$VAR" | tr -d '\n' | xclip -sel clip
