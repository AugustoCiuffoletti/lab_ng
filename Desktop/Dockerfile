FROM accetto/ubuntu-vnc-xfce-g3:latest

ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Tools per sudo esercizi networking
RUN echo "headless" | sudo -S apt-get -qq update \
   && echo "headless" | sudo -S sh -c 'echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections' \
   && echo "headless" | sudo -S apt-get -qq --no-install-recommends install netcat iproute2 net-tools dnsutils iputils-ping traceroute less git make nmap wireshark packeth firefox openssh-client
