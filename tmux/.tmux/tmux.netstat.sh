#!/bin/bash

# This script is only compatible with tmux.

nc -z -w 1 8.8.8.8 53 &>/dev/null

if [ $? -ne 0 ];then
    echo -e "#[fg=colour160,bg=colour234]⏺#[default]"
else
    echo -e "#[fg=colour33,bg=colour234]⏺#[default]"
fi

# echo -e "#[fg=colour34,bold]↓#[fg=colour244,nobold]$((RXDIF/1024))#[fg=colour231,italics]K \
#[fg=colour197,bold,noitalics]↑#[fg=colour244,nobold]$((TXDIF/1024))#[fg=colour231,italics]K#[default]"
