#!/bin/bash

# needs to run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

while true; do
    echo "Updating Git"
    git stash
    git pull

    echo "Setting required permissions"
    sudo chmod -R 777 *
    
    echo "Restarting Odoo"
    service odoo-server restart
    
    echo "Now I wait"
    sleep 120
done