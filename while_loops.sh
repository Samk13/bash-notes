#!/bin/sh

x=1

# while [ $x -le 10 ]
# do
#     echo $x
#     x=$(( $x + 1 )) # create a new var in order to work
#     sleep 0.5
# done

# test existence of file:
file=test-3.sh
while [ -f $file ]
do
    echo "file exists $(date)"
    sleep 5
done
echo "$file not exists, last check at $(date)"




