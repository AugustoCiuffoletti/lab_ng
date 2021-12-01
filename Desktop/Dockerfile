FROM accetto/ubuntu-vnc-xfce:latest

ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Tools per esercizi networking
RUN apt-get -qq update \
   && apt-get -qq --no-install-recommends install netcat \
   && apt-get -qq --no-install-recommends install iproute2 \
   && apt-get -qq --no-install-recommends install net-tools \
   && apt-get -qq --no-install-recommends install dnsutils \
   && apt-get -qq --no-install-recommends install iputils-ping \
   && apt-get -qq --no-install-recommends install traceroute \
   && apt-get -qq --no-install-recommends install less \
   && apt-get -qq --no-install-recommends install git \
   && apt-get -qq --no-install-recommends install make \
   && apt-get -qq --no-install-recommends install nmap \
   && apt-get -qq --no-install-recommends install wireshark \
   && apt-get -qq --no-install-recommends install packeth \
   && apt-get -qq --no-install-recommends install firefox
