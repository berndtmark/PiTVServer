#!/bin/bash
source ./settings.conf

echo "allow sub scripts to be executable..."
sudo chmod +x -R $SCRIPTS

echo "execute..."
$SCRIPTS/global-packages.sh
$SCRIPTS/sabnzb.sh
$SCRIPTS/plex.sh
$SCRIPTS/sickbeard.sh

echo "pm2 to autostart..."
# pm2 startup
## this will change - use `pm2 startup` to get script
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u pi --hp /home/pi
pm2 save