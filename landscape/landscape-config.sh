#!/bin/bash

#Ensure system up to date
sudo apt update
sudo apt upgrade -y
#Install client
sudo apt install landscape-client
#Copy and use server public key
sudo cp ~/.dotfiles/landscape/landscape_server.pem /etc/landscape/server.pem
echo ssl_public_key = /etc/landscape/server.pem | sudo tee -a /etc/landscape/client.conf
#Register machine
sudo landscape-config --account-name standalone --url https://landscape/message-system --ping-url http://landscape/ping
