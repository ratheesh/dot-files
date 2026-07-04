#!/bin/bash
# Copyright (c) 2026 Ratheesh <ratheeshreddy@gmail.com>
# Author: Ratheesh
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Code references: https://github.com/janoamaral/tokyo-night-tmux

# Get network transmit data
function get_bytes() {
  local interface="$1"
  if [[ "$(uname)" == "Linux" ]]; then
    awk -v interface="$interface" '$1 == interface ":" {print $2, $10}' /proc/net/dev
  elif [[ "$(uname)" == "Darwin" ]]; then
    netstat -ib | awk -v interface="$interface" '/^'"${interface}"'/ {print $7, $10}' | head -n1
  else
    # Unsupported operating system
    exit 1
  fi
}

# Convert into readable format
function readable_format() {
  local bytes=$1
  local secs=${2:-1}

  if [[ $bytes -lt 1048576 ]]; then
    echo "$(bc -l <<<"scale=1; $bytes / 1024 / $secs")KB/s"
  else
    echo "$(bc -l <<<"scale=1; $bytes / 1048576 / $secs")MB/s"
  fi
}

# Auto-determine interface
function find_interface() {
  local interface
  if [[ $(uname) == "Linux" ]]; then
    interface=$(awk '$2 == 00000000 {print $1}' /proc/net/route)
  elif [[ $(uname) == "Darwin" ]]; then
    interface=$(route get default 2>/dev/null | grep interface | awk '{print $2}')
    # If VPN, fallback to en0
    [[ ${interface:0:4} == "utun" ]] && interface="en0"
  fi
  echo "$interface"
}

# Icons
declare -A NET_ICONS
NET_ICONS[traffic_tx]="#[fg=colour167]\U000f06f6"    # nf-md-upload_network
NET_ICONS[traffic_rx]="#[fg=colour72]\U000f06f4"   # nf-md-download_network

# Determine interface if not set
if [[ -z $INTERFACE ]]; then
  INTERFACE=$(find_interface)
  [[ -z $INTERFACE ]] && exit 1
  # Update tmux option for this session
  tmux set-option -g @tokyo-night-tmux_netspeed_iface "$INTERFACE"
fi

# Echo network speed
read -r RX1 TX1 < <(get_bytes "$INTERFACE")
sleep "$TIME_DIFF"
read -r RX2 TX2 < <(get_bytes "$INTERFACE")

RX_DIFF=$((RX2 - RX1))
TX_DIFF=$((TX2 - TX1))

RX_SPEED="#[fg=colour252]$(readable_format "$RX_DIFF" "$TIME_DIFF")"
TX_SPEED="#[fg=colour252]$(readable_format "$TX_DIFF" "$TIME_DIFF")"

OUTPUT="${RESET}${NET_ICONS[traffic_rx]} $RX_SPEED ${NET_ICONS[traffic_tx]} $TX_SPEED#{RESET}"
echo -e "$OUTPUT"

# End of File
