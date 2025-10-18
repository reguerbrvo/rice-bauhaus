#!/usr/bin/env bash
set -euo pipefail

ICON=" "
# One place to point at rofi + your theme.
ROFI_CMD=(rofi -dmenu -theme "$HOME/.config/rofi/launchers/type-1/style-15.rasi")
PROMPT="  Notifications"

# ---------------------------------------------------------------------
dunst_ok() { dunstctl count history >/dev/null 2>&1; }

bar() {
  if dunst_ok; then
    echo "$ICON $(dunstctl count history)"
  else
    echo "$ICON -"
  fi
}

menu() {
  if ! dunst_ok; then
    printf 'Dunst is not running.\n' | "${ROFI_CMD[@]}" -p "$PROMPT" >/dev/null
    exit 1
  fi

  dunstctl history | jq -r '
        .data[][]
        | (.timestamp.data? // 0) as $ts
        | (.appname.data?   // "?")   as $app
        | (.summary.data?   // "")    as $summary
        | (.body.data?      // "")    as $body
        | ($ts/1000 | strftime("%H:%M")) as $time
        | "\($time)  \($app) — \($summary)  \($body | gsub("\n"; " "))"
    ' | "${ROFI_CMD[@]}" -p "$PROMPT" >/dev/null
}

case "${1:-}" in
--menu) menu ;;
*) bar ;;
esac
