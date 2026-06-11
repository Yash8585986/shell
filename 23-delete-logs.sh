#!/bin/bash

LOGS_FOLDER="/home/ec2-user/app-logs"
SCRIPT_NAME=$(basename "$0")
LOGS_FILE="$LOGS_FOLDER/${SCRIPT_NAME}.log"


if [ ! -d $LOGS_FOLDER ]; then
    echo "$LOGS_FOLDER doesn't exsit"
    exit 1
fi

FILES_TO_DELETE=$(find $LOGS_FOLDER -name "*.log" -mtime +14)
echo "$FILES_TO_DELETE"

while IFS= read -r filepath;
do
    echo "Deleting file:$filepath"
    rm -f $filepath
    echo "Deleted file:$filepath"

done <<< $FILES_TO_DELETE



