#!/bin/sh

release_file=/etc/os-release

# if [ -d /etc/pacman.d ] # or you can write it like
if grep -q "Arch" $release_file; then
    echo this is an arch linux system
fi

# if [ -d /etc/apt ]
if grep -q "Ubuntu" $release_file; then
    echo "updating packages ..."
    sudo apt update
    echo "Updating succussfull with code $?"
    echo upgrading ...
    sudo apt upgrade -y
    if [ ! $? -eq 0 ]; then
        echo "Something went wrong"
        exit 1
    else
        echo "upgeade done successfully"
        exit 0
    fi
fi
