FROM accetto/ubuntu-vnc-xfce:latest

ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get -qq update \
    && apt-get -qq --no-install-recommends install netcat wireshark packeth \
    && apt-get -qq --no-install-recommends install firefox 
