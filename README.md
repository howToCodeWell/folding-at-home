# How To Code Well Folding@Home

How To Code Well Team [236997](https://stats.foldingathome.org/team/236997)

## Install
```bash
$ cp config.dist.xml .config.xml
```
Adjust the variables in the config.xml

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
## Install manually without Docker compose
```bash
# Create volume for work units
$ docker volume create fahclient

# Run container
$ docker run -v fahclient:/var/lib/fahclient -v ${PWD}/config.xml:/etc/fahclient/config.xml --name=fah_test -d howtocodewell/folding-at-home
```
