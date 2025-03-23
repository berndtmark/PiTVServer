# TVServer
This script will setup 6 applications.
* Sonarr/Radarr - Used to fetch .nzb files from your indexer and send them to your download client
    * Sanarr - TV Shows
    * Radarr - Movies
* Sabnzb - Your download client. Will receive .nzb files, and fetch the articles from your usenet server
* Plex - This is where you watch stuff
* Jellyfin - This is where you watch stuff (another option to Plex - comment out/ignore if you dont need)
* Tautulli - Statistics about Plex

## Script Setup
Directory locations & setting can to be set in .env

## Start!
Clone the repository and run _init.sh_. Script can be re-run to upgrade containers (the apps).
Below is an example of how to run this script.
```
$ mkdir /home/pi/init && cd /home/pi/init
$ sudo apt-get update && sudo apt-get install -y git
$ git clone https://github.com/berndtmark/PiTVServer /home/pi/init
$ chmod +x ./init.sh

$ /home/pi/init/init.sh
```

## URLs
- Sonarr (http://YourIP:8989)
- Radarr (http://YourIP:7878)
- Sabnzb (http://YourIP:8080)
- Plex (http://YourIP:32400/web/index.html) 
- Jellyfin (http://YourIP:8096) 
- Tautulli (http://YourIP:8181)

## Additional
### Mounting drive (example)
```
$ mkdir /mnt/PIHDD && sudo chmod +x -R /mnt/PIHDD
$ echo 'LABEL=PIDRIVE1  /mnt/PIHDD            ext4    defaults,noatime  0       0' | sudo tee -a /etc/fstab
```

### Setting up auto-update (example)
Update with a simple cron job. _0 2 * * 1_ is set to run at 2am every Monday, replace with your chosen cron expression.
```
$ (crontab -l 2>/dev/null; echo "0 2 * * 1 /home/pi/init/init.sh >> /home/pi/init/log.txt 2>&1") | crontab -
```

## Troubleshooting
### Apps not running due to libseccomp2
Install library dependency
```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC 648ACFD622F3D138
$ echo "deb http://deb.debian.org/debian buster-backports main" | sudo tee -a /etc/apt/sources.list.d/buster-backports.list
$ sudo apt update
$ sudo apt install -t buster-backports libseccomp2
```
Restart containers