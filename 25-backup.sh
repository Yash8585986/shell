#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/backup.log"
SOURCE_DIR="$1"
DEST_DIR="$2"
DAYS=${3:-14}

if [ $USERID -ne 0 ]; then
    echo "Please run this with root or sudo access" 
    exit 1
fi

mkdir -p $LOGS_FOLDER

log(){

    echo "$(date "+%m/%d/%y %H:%M:%S") $1" | tee -a $LOGS_FILE
    
}

USAGE(){
    echo "sudo backup <sour_dri> <dest_dir> <days> [default days 14]"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
    echo "Source Directory:$SOURCE_DIR doesn't exist"
    exit 1
fi
if [ ! -d $DEST_DIR ]; then
    echo "Destination directory: $DEST_DIR doesn't exist"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +"$DAYS")

log "Backup Started"
log "Source directory: $SOURCE_DIR"
log "Destination directory: $DEST_DIR"
log "Days:$DAYS"



if [ -z "${FILES}" ]; then
    log "No files to archive...skipping"    
else
    log "Files found archiving $FILES"
    TIME_STAMP=$(date +%F:%T)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIME_STAMP.tar.gz"
    echo "Archive file name=$ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +"$DAYS") | xargs tar -zcvf $ZIP_FILE_NAME

        if [ -f $ZIP_FILE_NAME ]; then
            log "Archival is ...success"
            
            while IFS= read -r filepath;
            do
                echo "Deleting file:$filepath"
                rm -f $filepath
                echo "Deleted file:$filepath"
            done <<< $FILES
        else
            log "Archival is...failure"
            exit 1
        fi
fi