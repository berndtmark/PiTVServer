# TVServer

## Script Setup
Directory locations can to be set in settings.conf

## Start!
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
### Download notifications
https://github.com/berndtmark/Yamahiro

### Mounting drive (example)
```
$ mkdir /mnt/PIHDD && sudo chmod +x -R /mnt/PIHDD
$ echo 'LABEL=PIDRIVE1  /mnt/PIHDD            ext4    defaults,noatime  0       0' | sudo tee -a /etc/fstab
```