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



dnf install nginx -y &>> $LOG_FILE
VALIDATE $? "nginx"

dnf install nodejs -y &>> $LOG_FILE
VALIDATE $? "nodejs"

dnf install mysql -y &>> $LOG_FILE
VALIDATE $? "mysql"

