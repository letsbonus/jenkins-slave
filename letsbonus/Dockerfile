FROM letsbonus/jenkins-slave:latest

# Docker stuff
RUN echo " \
http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache \
    docker \
    py-pip && \
    pip install docker-compose


# LetsBonus behaviour dependencies
RUN apk add --no-cache \
    git \
    rsync \
    curl
    