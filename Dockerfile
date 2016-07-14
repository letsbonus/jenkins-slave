FROM alpine:3.4

MAINTAINER Ferran Vidal <ferran.vidal@letsbonus.com>

RUN echo " \
http://dl-6.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk add --no-cache \
    bash \
    bash-doc \
    bash-completion

# Set user jenkins to the image
RUN adduser -h /home/jenkins -s $(which bash) -D jenkins &&\
    echo "jenkins:jenkins" | chpasswd

RUN apk add --no-cache \
    git \
    rsync \
    docker \
    py-pip

RUN pip install docker-compose

# Standard SSH port
EXPOSE 22

# Default command
CMD ["/usr/sbin/sshd", "-D"]