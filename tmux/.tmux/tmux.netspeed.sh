#!/bin/bash

# Network throughput for the tmux status bar.
#
# Stateless-via-cache: instead of sleeping 1s to measure a delta (which blocked
# the status bar on every refresh), this stores the previous byte counters plus
# a timestamp in a state file and computes the rate over the elapsed wall-clock
# time since the last invocation. Cost is now a few file reads, not a full second.

STATE="${TMPDIR:-/tmp}/tmux-netspeed-${USER:-$UID}.state"

RXB=0
TXB=0
for rxbytes in /sys/class/net/*/statistics/rx_bytes ; do
  let RXB+=$(<$rxbytes)
done
for txbytes in /sys/class/net/*/statistics/tx_bytes ; do
  let TXB+=$(<$txbytes)
done
NOW=$(date +%s.%N)

# Previous sample (rx tx timestamp); default to current so first run shows 0.
PRX=$RXB; PTX=$TXB; PNOW=$NOW
if [ -r "$STATE" ]; then
  read -r PRX PTX PNOW < "$STATE"
fi
printf '%s %s %s\n' "$RXB" "$TXB" "$NOW" > "$STATE"

# KiB/s over the elapsed interval (awk handles the float math + divide-by-zero).
read -r RXKBS TXKBS < <(awk -v rx="$RXB" -v tx="$TXB" -v now="$NOW" \
  -v prx="$PRX" -v ptx="$PTX" -v pnow="$PNOW" 'BEGIN {
    dt = now - pnow;
    if (dt <= 0) { print 0, 0; exit }
    printf "%d %d\n", (rx - prx) / 1024 / dt, (tx - ptx) / 1024 / dt
  }')

echo -e "#[fg=colour15,nobold]${RXKBS}#[fg=colour248,italics]KiB\
#[fg=#00D7BB,bold]󰁆#[fg=#a5abb8,bold,noitalics]•#[fg=colour9,bold,noitalics]󰁞#[fg=colour15,nobold]${TXKBS}#[fg=colour248,italics]KiB#[default]"

# End of File
