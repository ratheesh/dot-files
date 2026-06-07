#!/bin/bash

# CPU usage for the tmux status bar.
#
# Stateless-via-cache: replaces `iostat -c 1 2` (which sampled over a full second
# and blocked the status bar) with a /proc/stat delta between invocations. The
# previous total/idle jiffies are stashed in a state file; usage is computed from
# the difference since the last call. Cost is a single /proc read.

STATE="${TMPDIR:-/tmp}/tmux-cpu-${USER:-$UID}.state"

# First /proc/stat line: cpu user nice system idle iowait irq softirq steal ...
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
  # No elapsed jiffies yet (first run or same tick) — report idle.
  echo "0.0%"
else
  awk -v dt="$DTOTAL" -v di="$DIDLE" 'BEGIN { printf "%.1f%%", 100 * (dt - di) / dt }'
fi
# End of File
