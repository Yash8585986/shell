#!/bin/bash

#!/bin/bash

counter=1

while [ $counter -le 5 ]
do
    echo "Loop iteration: $counter"
    # Increment the counter by 1
    ((counter++))
done

echo "Loop finished!"