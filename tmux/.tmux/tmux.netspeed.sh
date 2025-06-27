#!/bin/bash

# This script is only compatible with tmux.

RXB=0
TXB=0
for rxbytes in /sys/class/net/*/statistics/rx_bytes ; do
  let RXB+=$(<$rxbytes)
done
for txbytes in /sys/class/net/*/statistics/tx_bytes ; do
  let TXB+=$(<$txbytes)
done

sleep 1

RXBN=0
TXBN=0
for rxbytes in /sys/class/net/*/statistics/rx_bytes ; do
  let RXBN+=$(<$rxbytes)
done
for txbytes in /sys/class/net/*/statistics/tx_bytes ; do
  let TXBN+=$(<$txbytes)
done
RXDIF=$(echo $((RXBN - RXB)) )
TXDIF=$(echo $((TXBN - TXB)) )

echo -e "#[fg=colour15,nobold]$((RXDIF/1024))#[fg=colour248,italics]KiB\
#[fg=#00D7BB,bold]󰁆#[fg=#a5abb8,bold,noitalics]•#[fg=colour9,bold,noitalics]󰁞#[fg=colour15,nobold]$((TXDIF/1024))#[fg=colour248,italics]KiB#[default]"

# End of File
