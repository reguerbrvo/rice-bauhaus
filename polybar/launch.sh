#!/bin/bash

killall -q polybar

polybar works 2>&1 | tee -a /tmp/polybar.log & disown
polybar log 2>&1 | tee -a /tmp/polybar.log & disown
polybar icon 2>&1 | tee -a /tmp/polybar.log & disown
polybar ipmine 2>&1 | tee -a /tmp/polybar.log & disown
polybar ipbox 2>&1 | tee -a /tmp/polybar.log & disown
polybar target 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
