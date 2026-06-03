#!/bin/bash

$USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root user or sudo"
fi

# dnf install nginx -y