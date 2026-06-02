#!/bin/bash

NUM1=100
NUM2=Yashwanth

SUM=$(($NUM1+$NUM2))

echo "SUM is :: ${SUM}"

Fruits=("Apple" "Banana" "Cherry")

echo "list of fruits:: ${Fruits[@]}"
echo "first fruit is : ${Fruits[0]}"
echo "second fruit is : ${Fruits[1]}"
echo "third fruit is : ${Fruits[2]}"
