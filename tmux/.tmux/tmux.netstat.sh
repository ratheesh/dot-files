#!/bin/bash

# This script is only compatible with tmux.

# nc -z -w 1 8.8.8.8 53 &>/dev/null
nc -z -w 1 github.com 443 &>/dev/null
if [ $? -ne 0 ];then
    echo -e "#[fg=colour196]󰖩 #[default]"
else
    echo -e "#[fg=colour39]󰖩 #[default]"
fi

# End of File
