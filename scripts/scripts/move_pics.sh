#!/bin/bash
/bin/mount -av

PIC_DIR_NAME=$(date +%F_%H)
#PIC_DIR="/nas/incoming/picam/$PIC_DIR_NAME"
VID_DIR="/nas/incoming/picam/$PIC_DIR_NAME"

#echo "Copying AVIs.. "
/bin/mkdir -p $VID_DIR
/usr/bin/find /ram/ -maxdepth 1 -name \*\.avi -cmin +1 -exec mv {} $VID_DIR \;

#echo "Copying JPGs to dir: $PIC_DIR"
#/bin/mkdir -p $PIC_DIR
#find /storage/motion/ -maxdepth 1 -name \*\.jpg -cmin +1 -exec mv {} $PIC_DIR \;
