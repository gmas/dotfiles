#!/bin/bash
echo "NAME: $NAME | Page count: $COUNT"

/usr/bin/scanimage --resolution 150 --mode Gray --button-controlled=yes --format=tiff --batch-count "$COUNT" --batch="/nas/scans/unsorted/$NAME-%d.tiff" 
echo "Finished scanning"

echo "Converting to PDF: $NAME.pdf"
#/usr/bin/convert -resize 1276x1754 "/nas/scans/unsorted/$NAME-*" /nas/scans/unsorted/$NAME.pdf
/usr/bin/convert "/nas/scans/unsorted/$NAME-*" /nas/scans/unsorted/$NAME.pdf

