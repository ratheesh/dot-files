#!/bin/bash

if ! [ -x "$(command -v iostat)" ]; then
	echo -e 'NA'
	exit 1
else
	# cpu=$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)
	cpu=$(iostat -c 1 2 | tail -n 2 | head -n 1 | awk '{usage=100-$NF} END {printf("%.1f%%", usage)}' | sed 's/,/./')
	echo -e ${cpu}
fi
# End of File
