#!/bin/sh

echo "%{F#e55252}󱄕  %{F#dddddd}$(/usr/bin/ifconfig wlan0 | grep "inet " | awk '{print $2}')%{u-}"
echo $(/usr/bin/ifconfig wlan0 | grep "inet " | awk '{print $2}') >~/.config/polybar/scripts/ip/ip.txt
