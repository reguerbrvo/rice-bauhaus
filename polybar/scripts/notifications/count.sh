#!/usr/bin/env bash
# Polybar bell + unread-count for Dunst history

icon="" # Font-Awesome bell

# If Dunst isn’t running just show the bell
pgrep -x dunst >/dev/null || {
  echo "$icon"
  exit 0
}

# Ask Dunst how many old notifications it keeps
count=$(dunstctl count history 2>/dev/null || echo 0)

[[ $count -gt 0 ]] && echo "$icon $count" || echo "$icon"
