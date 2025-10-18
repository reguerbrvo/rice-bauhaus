#!/usr/bin/env bash
# Rofi side-panel that lists Dunst history and re-pops the item you pick.

##############################################################################
# 1.  YOUR ROFI LAUNCHER – keep this one line up-to-date
##############################################################################
rofi_launcher="$HOME/.config/rofi/launchers/type-1/launcher.sh"

# Extra flags for that wrapper so we get classic “-dmenu” behaviour
rofi_args=(-dmenu -p "Notifications" -i -lines 15 -width 30 -location 5)

##############################################################################
# 2.  Build the menu from Dunst’s JSON history
##############################################################################
menu=$(
  dunstctl history | jq -r '
  .data[]
  | "\(.id)\t\(.appname): \(.summary)\(if .body|length>0 then " – " + .body else "" end)"'
)

# Nothing to show?  Bail out silently so the Polybar click does nothing.
[[ -z $menu ]] && exit 0

##############################################################################
# 3.  Show the list & replay the chosen notification
##############################################################################
selected_id=$(printf '%s\n' "$menu" |
  "$rofi_launcher" "${rofi_args[@]}" |
  cut -f1)

[[ -n $selected_id ]] && dunstctl history-pop "$selected_id"
