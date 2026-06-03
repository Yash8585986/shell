#!/bin/bash


USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-scripts"
LOG_FILE="/var/log/shell-scripts/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user" | tee -a $LOG_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){

    if [ $1 -ne 0 ]; then

    echo "installation of $2 failed" | tee -a $LOG_FILE
    exit 1
else
    echo "Installation of $2 successful" | tee -a $LOG_FILE
    fi
}


for i in $@
do
dnf list installed $i &>> $LOG_FILE
if [ $? -ne 0 ]; then
    echo "$i is not installed, installing now"
    dnf install $i -y &>> $LOG_FILE
    VALIDATE $? "$i Install"
else
    echo "$i is already installed skipping installation" 
fi
done