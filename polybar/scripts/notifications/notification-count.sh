#!/usr/bin/env bash
# Show a bell and the number of notifications kept in history

count=$(dunstctl count history) # pure number
icon=""                        # Font Awesome bell (or  etc.)

# Only add the number if there is something to show
[[ "$count" -gt 0 ]] && echo "$icon $count" || echo "$icon"
