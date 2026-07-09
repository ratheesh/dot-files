#!/usr/bin/env bash

# Copyright (c) 2026 Ratheesh <ratheeshreddy@gmail.com>
# Author: Ratheesh
#
# Copied from https://github.com/janoamaral/tokyo-night-tmux/blob/master/src/custom-number.sh
#
# Credits to janoamaral for the original script.
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

# Imports
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
. "${ROOT_DIR}/lib/coreutils-compat.sh"

format_hide=""
format_none="0123456789"
format_digital="🯰🯱🯲🯳🯴🯵🯶🯷🯸🯹"
format_fsquare="󰎡󰎤󰎧󰎪󰎭󰎱󰎳󰎶󰎹󰎼"
format_hsquare="󰎣󰎦󰎩󰎬󰎮󰎰󰎵󰎸󰎻󰎾"
format_dsquare="󰎢󰎥󰎨󰎫󰎲󰎯󰎴󰎷󰎺󰎽"
format_roman=" 󱂈󱂉󱂊󱂋󱂌󱂍󱂎󱂏󱂐"
format_super="⁰¹²³⁴⁵⁶⁷⁸⁹"
format_sub="₀₁₂₃₄₅₆₇₈₉"

# my custom ones
format_digits1="𝟬𝟭𝟮𝟯𝟰𝟱𝟲𝟳𝟴𝟵"
format_digits2="𝟎𝟏𝟐𝟑𝟒𝟓𝟔𝟕𝟖𝟗"
format_kn="೦೧೨೩೪೫೬೭೮೯"

ID=$1
FORMAT=${2:-none}

# Preserve leading whitespace for bash
format="$(eval echo \"\$format_${FORMAT}\")"

if [ "$FORMAT" = "hide" ]; then
  exit 0
fi

if [ -z "$format" ]; then
  echo "Invalid format: $FORMAT"
  exit 1
fi

# If format is roman numerals (-r), only handle IDs of 1 digit
if [ "$FORMAT" = "roman" ] && [ ${#ID} -gt 1 ]; then
  echo -n "$ID "
else
  for ((i = 0; i < ${#ID}; i++)); do
    DIGIT=${ID:i:1}
    echo -n "${format:DIGIT:1}"
  done
fi
