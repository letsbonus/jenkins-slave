FROM alpine:3.4

MAINTAINER Ferran Vidal "ferran.vidal@letsbonus.com"

RUN echo " \
http://dl-6.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk add --no-cache \
    git \
    rsync \
    docker \
    py-pip

RUN pip install docker-compose