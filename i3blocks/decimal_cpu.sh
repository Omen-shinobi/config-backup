#!/bin/bash

# Get the first snapshot of CPU stats
read -r cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
prev_idle=$((idle + iowait))
prev_total=$((user + nice + system + idle + iowait + irq + softirq + steal))

# Wait a brief moment to calculate the rate
sleep 0.5

# Get the second snapshot
read -r cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
idle=$((idle + iowait))
total=$((user + nice + system + idle + iowait + irq + softirq + steal))

# Calculate the differences
diff_idle=$((idle - prev_idle))
diff_total=$((total - prev_total))

# Calculate usage as a decimal (0.XX) using bc
# we use 1 - (idle/total) to get active usage
usage=$(echo "scale=2; 1 - ($diff_idle / $diff_total)" | bc -l)

# Ensure it always shows a leading zero (e.g., .09 becomes 0.09)
printf "%0.2f\n" "$usage"
