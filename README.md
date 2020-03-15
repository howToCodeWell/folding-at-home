# How To Code Well Folding@Home

How To Code Well Team [236997](https://stats.foldingathome.org/team/236997)

## Install
```bash
$ cp .env.dist .env
```
Adjust the variables 
```bash
// ./.env
USERNAME=YOUR_USERNAME
TEAM=236997
POWER=Low|Medium|High
PASSKEY=YOUR_PASSKEY
GPU=true|false
CPU_COUNT=1|2|...
```
Build and run the Docker container
```bash
$ docker-compose up -d --build
```
Monitor the logs
```bash
$ docker-compose logs -f fah
```

## Stopping containers
```bash
$ docker-compose stop fah
```

## Uninstall
```bash
$ docker-compose down -v --rmi='all'
```