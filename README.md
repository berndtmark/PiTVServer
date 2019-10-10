# TVServer
This script will setup 3 applications.
* Sonarr - Used to fetch .nzb files from your indexer and send them to your download client
* Sabnzb - Your download client. Will receive .nzb files, and fetch the articles from your usenet server
* Plex - This is where you watch stuff

## Script Setup
Directory locations can to be set in settings.conf

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
- Sabnzb (http://YourIP:8080)
- Plex (http://YourIP:32400/web/index.html) 

## Additional
### Mounting drive (example)
```
$ mkdir /mnt/PIHDD && sudo chmod +x -R /mnt/PIHDD
$ echo 'LABEL=PIDRIVE1  /mnt/PIHDD            ext4    defaults,noatime  0       0' | sudo tee -a /etc/fstab
```
