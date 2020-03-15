FROM ubuntu

MAINTAINER Peter Fisher
ENV DEBIAN_FRONTEND noninteractive

ARG USERNAME=Anonymous
ARG TEAM=236997
ARG POWER=Medium
ARG PASSKEY=????
ARG GPU=false
ARG CPU_COUNT=1

ENV USERNAME=${USERNAME}
ENV TEAM=${TEAM}
ENV POWER=${POWER}
ENV PASSKEY=${PASSKEY}
ENV GPU=${GPU}
ENV CPU_COUNT=${CPU_COUNT}


ADD config.xml /usr/share/doc/fahclient/sample-config.xml

RUN apt-get update && apt-get install -y wget  \
  && wget -O fahclient_7.4.4_amd64.deb "https://download.foldingathome.org/releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb" --no-check-certificate \
  && dpkg -i --force-depends fahclient_7.4.4_amd64.deb \
  && chown fahclient:root /etc/fahclient/config.xml

ADD config.xml /etc/fahclient/config.xml
RUN sed -i -e "s/{{USERNAME}}/$USERNAME/;s/{{TEAM}}/$TEAM/;s/{{POWER}}/$POWER/;s/{{PASSKEY}}/$PASSKEY/;s/{{GPU}}/$GPU/;s/{{CPU_COUNT}}/$CPU_COUNT/" /etc/fahclient/config.xml

EXPOSE 7396

CMD /etc/init.d/FAHClient start && tail -F /var/lib/fahclient/log.txt