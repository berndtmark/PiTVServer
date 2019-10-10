#!/bin/bash

echo "installing git..."
sudo apt-get update
sudo apt-get -y install git

echo "installing docker..."
if [ -x "$(command -v docker)" ]; then
    echo "Docker already installed!"
else
    curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh
fi

echo "installing node..."
if [ "$(node -v)" ]; then
    echo "Node already installed!"
else
    curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi