FROM evarga/jenkins-slave:latest

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y git