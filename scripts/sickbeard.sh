#!/bin/bash
source ./settings.conf

echo "creating directory..."
mkdir $SICKBEARD_CONFIG && sudo chmod +x -R $SICKBEARD_CONFIG

echo "installing additional packages..."
sudo apt-get update
sudo apt-get install -y python-cheetah

echo "creating sickbeard..."
git clone git://github.com/midgetspy/Sick-Beard.git $SICKBEARD_CONFIG

# echo "setting up config..."
# sudo cp -R $INIT/Sickbeard/* $SICKBEARD_CONFIG

echo "fixing additional issues..."
# fix issue with versioning
cd $SICKBEARD_CONFIG
sed -i 's/Cheetah.Version\[0\] !=/Cheetah\.Version\[0\] </g' SickBeard.py

echo "starting sickbeard..."
cd $SICKBEARD_CONFIG
pm2 start SickBeard.py --name SickBeard --log-date-format 'YYYY-MM-DD HH:mm'