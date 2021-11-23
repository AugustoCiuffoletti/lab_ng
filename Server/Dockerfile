FROM ubuntu:focal
RUN apt update
RUN apt -y upgrade
RUN apt install -y netcat iproute2 net-tools
RUN apt install -y iputils-ping traceroute
#RUN logger "ciao"

ENV DEBIAN_FRONTEND noninteractive
#SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup the default user.
RUN useradd -rm -d /home/user -s /bin/bash -g root -G sudo user
RUN echo 'user:user' | chpasswd

RUN apt-get -qq update \
    && apt-get -qq --no-install-recommends install vim-tiny=2:8.1.* \
    && apt-get -qq --no-install-recommends install sudo=1.8.* \
    && apt-get -qq --no-install-recommends install python3-pip=20.0.* \
    && apt-get -qq --no-install-recommends install openssh-server=1:8.* \
    && apt-get -qq clean    \
    && rm -rf /var/lib/apt/lists/*

VOLUME /home/user

COPY entrypoint.sh /entrypoint.sh

RUN ssh-keygen -A -v

ENTRYPOINT /entrypoint.sh

EXPOSE 22
