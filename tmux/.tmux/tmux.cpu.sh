#!/bin/bash

STATE="${TMPDIR:-/tmp}/tmux-cpu-${USER:-$UID}.state"

if [[ "$(uname)" == "Darwin" ]]; then
  RAW=$(top -l 2 -n 0 -s 0 | head -4 | tail -1 | awk '{print $3}')
  RAW="${RAW//%/}"
  # echo " $RAW%"
  printf -v cpu "%04.1f%" "$RAW"
  echo "#[fg=#B465F1] #[fg=#c0c0c0]$cpu%"
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
  echo "00.0%"
else
  awk -v dt="$DTOTAL" -v di="$DIDLE" 'BEGIN { printf "#[fg=#B465F1] #[fg=#c0c0c0]%04.1f%%", 100 * (dt - di) / dt }'
fi
# End of File
