#!/bin/bash
#####################
### SET CONSTANTS ###
#####################
LAP_OUTPUT="eDP-1"
declare -A output_dict

####################
### SETUP LAPTOP ###
####################
output_dict[${LAP_OUTPUT}]=$(cat /proc/acpi/button/lid/LID0/state | tr -s " " | cut -d " " -f 2)

#######################
### SETUP EXTERNALS ###
#######################
ext_output_list=( $(xrandr | grep -v "^ " | grep -v "^Screen" | grep -v "^${LAP_OUTPUT}" | cut -d " " -f 1,2) )
for (( i=0; i<$(( ${#ext_output_list[@]}/2)); i++ )); do
    output_dict[${ext_output_list[2*i]}]=${ext_output_list[2*i+1]}
done

#######################
### DETERMINE SETUP ###
#######################
if [ "${output_dict[${LAP_OUTPUT}]}" = "open" ] && [ "${output_dict["DP-2"]}" = "disconnected" ]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off
    notify-send --expire-time=3000 "Display setup: laptop only"
elif [ "${output_dict[${LAP_OUTPUT}]}" = "open" ] && [ "${output_dict["DP-2"]}" = "connected" ]; then
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
    notify-send --expire-time=3000 "Display setup: monitor + laptop"
elif [ "${output_dict[${LAP_OUTPUT}]}" = "closed" ] && [ "${output_dict["DP-2"]}" = "connected" ]; then
    xrandr --output eDP-1 --off --output DP-1 --off --output DP-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
    notify-send --expire-time=3000 "Display setup: monitor only"
else
    echo "Error"
fi
