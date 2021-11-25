FROM ubuntu:focal

RUN apt-get -qq update \
    && apt-get -qq --no-install-recommends install nano \
    && apt-get -qq --no-install-recommends install openssh-server \
    && apt-get -qq --no-install-recommends install sudo \
    && apt-get -qq --no-install-recommends install netcat iproute2 net-tools \
    && apt-get -qq --no-install-recommends install iputils-ping traceroute \
    && apt-get -qq clean    \
    && rm -rf /var/lib/apt/lists/*

# Setup the default user.
RUN useradd -rm -d /home/user -s /bin/bash -g root -G sudo user
RUN echo 'user:user' | chpasswd
RUN ssh-keygen -A -v

CMD /etc/init.d/ssh start && bash

