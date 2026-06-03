#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user or sudo"
    exit 1

fi

 echo "installing nginx server"
 dnf install nginx -y

 if [$? -ne 0 ]; then
    echo "installation failed"
    exit 1
else 
 echo "Installation successful"

 fi

