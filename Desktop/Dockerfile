FROM dorowu/ubuntu-desktop-lxde-vnc:focal

ENV DEBIAN_FRONTEND noninteractive
# SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Tools per sudo esercizi networking
RUN apt update
RUN apt-get -qq install apt-utils
# RUN apt upgrade

# Questo installa e configura wireshark
RUN apt-get -qq install wireshark
# RUN usermod -a -G wireshark user
#   && echo "headless" | sudo -S sh -c 'echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections' \
#   && echo "headless" | sudo -S apt-get -qq --no-install-recommends install netcat iproute2 net-tools dnsutils iputils-ping traceroute less git make nmap wireshark packeth firefox openssh-client
