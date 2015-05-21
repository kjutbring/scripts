#!/bin/bash

# set placement of monitor in relation to laptop.  

while getopts ":l:" opt; do
    case $opt in
        l)
            if [ "$OPTARG" = "right" ]; then
                if xrandr -q|grep "LVDS1 connected"; then
                    xrandr --output LVDS1 --auto
                fi
                if xrandr -q|grep "VGA1 connected"; then
                    xrandr --output VGA1 --auto
                    xrandr --output VGA1 --right-of LVDS1
                fi
            fi
            if [ "$OPTARG" = "left" ]; then
                if xrandr -q|grep "LVDS1 connected"; then
                    xrandr --output LVDS1 --auto
                fi
                if xrandr -q|grep "VGA1 connected"; then
                    xrandr --output VGA1 --auto
                    xrandr --output VGA1 --left-of LVDS1
                fi
            fi
        ;;
        \?)
            echo "[-] invalid argument, specify location of additional monitor. l + right/left."
            exit 1
        ;;
        :)
            if xrandr -q|grep "LVDS1 connected"; then
                xrandr --output LVDS1 --auto
            fi
        ;;
    esac
done


