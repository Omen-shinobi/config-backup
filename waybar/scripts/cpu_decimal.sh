#!/bin/bash
# Get the CPU usage (load)
usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')

# Divide by 100 and format to 2 decimal places
echo "$usage" | awk '{printf "%.2f\n", $1/100}'
