#! /bin/bash -e

CONTENT=$(cat /home/marseille/.config/polybar/scripts/target/ip.txt)
echo "%{F#e55252}󰯐  %{F#ffffff}$CONTENT"
