#!/bin/sh

if [ "$1" == "--hex" ]
then
    HEX_MODE=1
    shift
else
    HEX_MODE=0
fi

TABLE="$1"
FILENAME="$2"

# take first line, which has an INSERT statement, and change the table name from Dvc_Reg to $TABLENAME
INSERT="`tr -d \\\\r < "$FILENAME" | head -1 | sed s/Dvc_Reg/$TABLE/`"

echo "-- Updated INSERT LINE: $INSERT"

echo "PRAGMA synchronous=OFF;"

echo "BEGIN;"

# Take all subsequent lines, which are of the form "   (val,val,val,val)," and turn them into INSERT statements using the saved first line. Note that the last one ends in ); instead of ), - the regex to replace ), will just fail to happen and we'll be fine.

if [ $HEX_MODE == 1 ]
then
    tr -d \\r < "$FILENAME" | tail --lines=+2 | sed -E "s/^[ \t]+\\(/$INSERT (/" | sed "s/),$/);/" | sed -E "s/,(0x[0-9a-bA-B]*),/,'\\1',/"
else
    tr -d \\r < "$FILENAME" | tail --lines=+2 | sed -E "s/^[ \t]+\\(/$INSERT (/" | sed "s/),$/);/"
fi

echo "COMMIT;"
