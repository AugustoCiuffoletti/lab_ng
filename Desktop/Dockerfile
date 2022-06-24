FROM dorowu/ubuntu-desktop-lxde-vnc:focal

ENV DEBIAN_FRONTEND noninteractive
# SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Tools per sudo esercizi networking
RUN apt update
RUN yes | unminimize
RUN apt-get --yes upgrade
RUN apt-get --yes install apt-utils
# Installazione package generazione e cattura di pacchetti
RUN apt-get --yes install wireshark
RUN apt-get --yes install packeth
# Installazione strumenti di rete
RUN apt-get --yes install netcat iproute2 net-tools dnsutils iputils-ping traceroute nmap
# Installazione strumenti di sviluppo
RUN apt-get --yes install make git
RUN apt-get --yes install openssh-client openssh-server
# Ma non riesco a far partire il demone sshd 
