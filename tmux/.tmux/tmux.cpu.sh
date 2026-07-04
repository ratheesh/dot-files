#!/bin/bash

STATE="${TMPDIR:-/tmp}/tmux-cpu-${USER:-$UID}.state"

if [[ "$(uname)" == "Darwin" ]]; then
  RAW=$(top -l 2 -n 0 -s 0 2>/dev/null | tail -1 | awk '{print $3}')
  RAW="${RAW//%/}"
  echo "$RAW%"
  exit 0
fi

read -r _ user nice system idle iowait irq softirq steal _ < /proc/stat
IDLE=$((idle + iowait))
TOTAL=$((user + nice + system + idle + iowait + irq + softirq + steal))

PIDLE=$IDLE; PTOTAL=$TOTAL
if [ -r "$STATE" ]; then
  read -r PIDLE PTOTAL < "$STATE"
fi
printf '%s %s\n' "$IDLE" "$TOTAL" > "$STATE"

DTOTAL=$((TOTAL - PTOTAL))
DIDLE=$((IDLE - PIDLE))
if [ "$DTOTAL" -le 0 ]; then
  echo "0.0%"
else
  awk -v dt="$DTOTAL" -v di="$DIDLE" 'BEGIN { printf "%.1f%%", 100 * (dt - di) / dt }'
fi
# End of File
