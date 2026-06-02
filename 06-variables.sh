#!/bin/bash

start_time=$(date +%S)

echo "script executed at ${start_time}"

sleep 10

end_time=$(date +%S)
Total_time=$(($end_time-$start_time))

echo "script executed in ${Total_time} seconds"

