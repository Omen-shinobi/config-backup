#!/bin/bash
# htop math: Total - Free - Buffers - Cached - SReclaimable
mem_info=$(cat /proc/meminfo)
total=$(echo "$mem_info" | grep MemTotal | awk '{print $2}')
free=$(echo "$mem_info" | grep MemFree | awk '{print $2}')
buffers=$(echo "$mem_info" | grep Buffers | awk '{print $2}')
cached=$(echo "$mem_info" | grep ^Cached | awk '{print $2}')
srec=$(echo "$mem_info" | grep SReclaimable | awk '{print $2}')

used_kb=$((total - free - buffers - cached - srec))
used_gb=$(echo "scale=1; $used_kb / 1024 / 1024" | bc)
echo "$used_gb"GiB
