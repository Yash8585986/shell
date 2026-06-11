#!/bin/bash
USERID=($id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/backup.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this with root or sudo access" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p LOGS_FOLDER

USAGE(){
    echo "sudo backup <sour_dri> <dest_dir> <days> [default days 14]"
    exit1
}

if [ $# -lt 2 ]; then
    USAGE
fi
