#!/bin/bash

# This script is only compatible with tmux.

nc -z -w 1 8.8.8.8 53 &>/dev/null
if [ $? -ne 0 ];then
    echo -e "#[fg=colour160]🔴#[default]"
else
    echo -e "#[fg=colour33]🔴#[default]"
fi

# End of File
