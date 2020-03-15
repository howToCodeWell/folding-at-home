# How To Code Well Folding@Home

## Install
```bash
cp .env.dist .env
```
Adjust the variables 
```bash
// ./.env
USERNAME=<YOUR_USERNAME>
TEAM=236997
POWER=<low|medium|high>
PASSKEY=<YOUR_PASSKEY>
GPU=<true|false>
```
Build and run the Docker container
```bash
$ docker-compose up -d --build
```
Monitor the logs
```bash
$ docker-compose logs -f fah
```