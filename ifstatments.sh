#!/bin/sh

# Check if file exists

# if [ -f README.md ]
# then
#     echo "The file exists"
# else
#     echo "The file does not exists"
# fi

# # Check is a command is available
# command=htop
# if [ -f $(which $command) ]
# then
#     echo "you have htop, lets run it"
#     htop
# else
#     echo "installing htop"
# fi

# Check is a command is available
command=htop
if command -v $command
then
    echo "you have htop, lets run it"
    htop
else
    echo "installing htop"
fi