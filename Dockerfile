FROM ubuntu

MAINTAINER Peter Fisher
ENV DEBIAN_FRONTEND noninteractive

ADD config.xml /usr/share/doc/fahclient/sample-config.xml
ADD config.xml /etc/fahclient/config.xml

RUN apt-get update && apt-get install -y wget  \
  && wget -O fahclient_7.5.1_amd64.deb "https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb" --no-check-certificate \
  && dpkg -i --force-depends fahclient_7.5.1_amd64.deb \
  && chown fahclient:root /etc/fahclient/config.xml

EXPOSE 7396

CMD /etc/init.d/FAHClient start && tail -F /var/lib/fahclient/log.txt