#!/bin/bash
if [ -z "$1" ]
then
    echo "\$1 is empty (requires user)"
else
    echo "Adding user [" + $1 + "] to Sudo"
    su -i
    sudo usermod -aG sudo $1
    shutdown -r now
fi