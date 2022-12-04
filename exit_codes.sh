#!/bin/sh

# Check exit code
package=htop

if command -v $package
then echo "You are ready to go."
else
    sudo apt install $package -y >>package_install.log # output command to log file
fi

if [ $? -eq 0 ]
then
    echo "You are good, the pachage is been installed successfully."
else
    echo "Something went wrong. the packages is not been installed successfully"
fi