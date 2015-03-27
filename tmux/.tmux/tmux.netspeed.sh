#!/bin/bash

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

echo -e "↓$((RXDIF/1024))K↑$((TXDIF/1024))K"
