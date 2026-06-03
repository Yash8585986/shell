#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user"
    exit 1
fi

VALIDATE(){

    if [ $1 -ne 0 ]; then

    echo "installation of $2 failed"
    exit 1
else
    echo "Installation of $2 successful"
    fi
}



dnf install nginx -y
VALIDATE $? "nginx"

dnf install nodejs -y
VALIDATE $? "nodejs"

dnf install mysql -y
VALIDATE $? "mysql"

