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
$ docker run -v fahclient:/var/lib/fahclient -v ${PWD}/config.xml:/etc/fahclient/config.xml --name=fah -d howtocodewell/folding-at-home
```
Monitor the logs
```bash
$ docker logs -f fah
```

## Configuration
A typical config file looks like this
```xml
<config>
  <user value="pfwd"/>
  <team value="236997"/>
  <passkey value="<YOUR_PASSKEY>"/>
  <power value="Medium"/>
  <gpu value="false"/>
  <fold-anon value="true"/>
  <cpus v='3'/>
</config>
```