#!/bin/bash

iface=$1
RXB=$(</sys/class/net/"$iface"/statistics/rx_bytes)
TXB=$(</sys/class/net/"$iface"/statistics/tx_bytes)
sleep 1
RXBN=$(</sys/class/net/"$iface"/statistics/rx_bytes)
TXBN=$(</sys/class/net/"$iface"/statistics/tx_bytes)
RXDIF=$(echo $((RXBN - RXB)) )
TXDIF=$(echo $((TXBN - TXB)) )

echo -e "↓$((RXDIF/1024))K↑$((TXDIF/1024))K"
