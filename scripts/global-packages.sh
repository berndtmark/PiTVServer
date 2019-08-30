#!/bin/bash

echo "installing git..."
sudo apt-get update
sudo apt-get -y install git

echo "installing docker..."
sudo apt-get update
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh

echo "install node..."
sudo apt-get update
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "install pm2..."
sudo apt-get update
sudo npm install pm2 -g