#!/bin/bash
/bin/mount -av
PIC_DIR_NAME=$(date +%F_%H)
PIC_DIR="/nas/incoming/picam/$PIC_DIR_NAME"

echo "Copying AVIs.. "
/usr/bin/find /storage/motion/ -maxdepth 1 -name \*\.avi -cmin +5 -exec mv {} /nas/incoming/picam/ \;

echo "Copying JPGs to dir: $PIC_DIR"
/bin/mkdir -p $PIC_DIR
find /storage/motion/ -maxdepth 1 -name \*\.jpg -cmin +1 -exec mv {} $PIC_DIR \;
