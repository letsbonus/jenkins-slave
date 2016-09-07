FROM alpine:3.4

MAINTAINER Ferran Vidal <ferran.vidal@letsbonus.com>

# Add SSH package & mixed hacks
RUN apk add --no-cache \
    openssh && \
    ssh-keygen -A && \
    sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && \
    sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config

# Docker plugin dependencies
RUN apk add --no-cache \
    bash \
    bash-doc \
    bash-completion

# Add JDK support
RUN apk add --no-cache \
    openjdk7-jre

# Set user jenkins to the image
RUN adduser -h /home/jenkins -D jenkins &&\
    echo "jenkins:jenkins" | chpasswd

# Docker stuff
RUN echo " \
http://dl-6.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache \
    docker \
    py-pip && \
    pip install docker-compose


# LetsBonus behaviour dependencies
RUN apk add --no-cache \
    git \
    rsync \
    curl

# Standard SSH port
EXPOSE 22

# Default command
CMD ["/usr/sbin/sshd", "-D"]
