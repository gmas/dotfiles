function used_ram {
ps axu | grep -i "$1" | awk 'BEGIN {FS = " "} ; {sum+=$6} END {print sum}'
}
