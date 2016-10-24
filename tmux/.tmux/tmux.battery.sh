#!/usr/bin/env bash

battery_soc=`acpi|cut -d: -f 2|cut -d, -f 2 | sed -e "s/\s//" -e "s/%.*//"`
charging_status=`acpi|cut -d: -f 2|cut -d, -f 1 | sed -e "s/\s//"`

# echo "Battery SOC: $battery_soc"
# echo "Charging Status: $charging_status"

command_exists() {
    local command="$1"
    type "$command" >/dev/null 2>&1
}

# Check if acpi command is present. Else this command does not work!
if command_exists "acpi"; then
    if (( $battery_soc > "85" && $battery_soc <= "100" ));then
        echo -n '#[bg=colour234,fg=colour14]#[default]'
    elif (( $battery_soc > "65" && $battery_soc <= "85" ));then
        echo -n '#[bg=colour234,fg=colour142]#[default]'
    elif (( $battery_soc > "35" && $battery_soc <= "65" ));then
        echo -n '#[bg=colour234,fg=colour3]#[default]'
    elif (( $battery_soc > "15" && $battery_soc <= "35" ));then
        echo -n '#[bg=colour234,fg=colour1]#[default]'
    elif (( $battery_soc > "0" && $battery_soc <= "15" ));then
        echo -n '#[bg=colour234,fg=colour1]#[default]'
    else
        echo -n 'NA'
    fi

    if [ "$charging_status" = "Full" ];then
        echo -n ' #[bg=colour234,fg=colour12]#[default]'
    elif [ "$charging_status" = "Charging" ];then
        echo -n ' #[bg=colour234,fg=colour11]#[default]'
    else
        echo -n ''
    fi
fi
# End of File
