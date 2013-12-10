#!/bin/bash
WORK_DIR=$1
echo "$WORK_DIR"
PROC_DIR="$WORK_DIR/archived"
if [ ! -d $PROC_DIR ] ; then
echo "creating $PROC_DIR"
mkdir $PROC_DIR
fi

for d in $WORK_DIR*;
do
  echo "Processing $d"
  #PROC_DIR="$d/processed"

  nice -15 ufraw-batch --wb=camera --exposure=auto --out-type=jpeg --compression=91 --out-path="$PROC_DIR" "$d/"*.CR2
done
