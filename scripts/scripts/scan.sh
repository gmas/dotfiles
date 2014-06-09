#!/bin/bash
echo "NAME: $NAME | Page count: $COUNT"
BASEDIR=/nas/scans/unsorted
TMPDIR=$BASEDIR/$NAME"_tmp"

/bin/mkdir -p $TMPDIR
/usr/bin/scanimage --resolution 150 --mode Gray --button-controlled=yes --format=tiff --batch-count "$COUNT" --batch="$TMPDIR"/"$NAME-%d.tiff" 
echo "Finished scanning to $TMPDIR"

echo "Converting to PDF: $BASEDIR/$NAME.pdf"
#/usr/bin/convert -resize 1276x1754 "/nas/scans/unsorted/$NAME_tmp/$NAME-*" /nas/scans/unsorted/$NAME.pdf
/usr/bin/convert $TMPDIR/$NAME-*.tiff /nas/scans/unsorted/$NAME.pdf

