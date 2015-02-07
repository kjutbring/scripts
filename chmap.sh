#!/bin/bash

# saves a few keystrokes. br, kittyj

while getopts ":a:" opt; do
  case $opt in
    a)
      eval $"setxkbmap -layout $OPTARG" >&2
      echo "locale switched to $OPTARG"
      ;;
    \?)
      echo "invalid arg, plz use -a + locale" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done