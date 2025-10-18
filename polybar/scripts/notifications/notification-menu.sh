#!/usr/bin/env bash
# Presents a side-panel menu with the full history and lets the user
# pick a notification to 'pop' (redisplay) via dunstctl.

launcher="rofi -dmenu -i -p 'Notifications' \\
                -location 5   \\  # 0-8: 5 = east side
                -width 30     \\  # 30 % of the screen
                -lines 15     \\  # initial list height
                -separator-style none"

# Export history as JSON and build "id<TAB>app: summary - body" lines
menu=$(dunstctl history | jq -r '.data[]
        | "\(.id)\t\(.appname): \(.summary)\(if .body != "" then " – " + .body else "" end)"')

selected_id=$(echo -e "$menu" | $launcher | cut -f1)

[[ -n "$selected_id" ]] && dunstctl history-pop "$selected_id"
