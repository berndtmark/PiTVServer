# TVServer
This script will setup 5 applications.
* Sonarr/Radarr - Used to fetch .nzb files from your indexer and send them to your download client
    * Sonarr - TV Shows
    * Radarr - Movies
* Sabnzb - Your download client. Will receive .nzb files, and fetch the articles from your usenet server
* Jellyfin - This is where you watch stuff
* Dockhand - Optional for managing the docker containers

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
- Jellyfin (http://YourIP:8096) 
- Dockhand (http://YourIP:3000)

## Additional
### Mounting drive (example)
```
$ mkdir /mnt/PIHDD && sudo chmod +x -R /mnt/PIHDD
$ echo 'LABEL=PIDRIVE1  /mnt/PIHDD            ext4    defaults,noatime  0       0' | sudo tee -a /etc/fstab
```

### Suggested Directory Structure
A recommended example of a folder setup. Allows for atomic moves (instant file moves, rather than copy+delete) with the correct container setup
```text
/mnt/PIHDD/
└── media/
    ├── movies/
    ├── shows/
    ├── downloads/
    └── temp/
```

### Setting up auto-update (example)
Update with a simple cron job. _0 2 * * 1_ is set to run at 2am every Monday, replace with your chosen cron expression.
```
$ (crontab -l 2>/dev/null; echo "0 2 * * 1 /home/pi/init/init.sh >> /home/pi/init/log.txt 2>&1") | crontab -
```