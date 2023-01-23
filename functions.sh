#!/bin/sh


check_exit_status() {
    if [$? -ne 0]
    then
        echo "something went wrong, see $?"
    fi
}
echo "test"
check_exit_status # you call it without ()