FROM ubuntu:focal

RUN apt-get -qq update \
    && apt-get -qq --no-install-recommends install nano \
    && apt-get -qq --no-install-recommends install openssh-server \
    && apt-get -qq --no-install-recommends install sudo

# Setup the default user.
RUN useradd -rm -d /home/user -s /bin/bash -g root -G sudo user
RUN echo 'user:user' | chpasswd

RUN ssh-keygen -A -v

# Tools per esercizi networking
RUN apt-get -qq update \
   && apt-get -qq --no-install-recommends install netcat \
   && apt-get -qq --no-install-recommends install iproute2 \
   && apt-get -qq --no-install-recommends install net-tools \
   && apt-get -qq --no-install-recommends install iputils-ping \
   && apt-get -qq --no-install-recommends install traceroute \
   && apt-get -qq --no-install-recommends install less \
   && apt-get -qq --no-install-recommends install git \
   && apt-get -qq --no-install-recommends install make

# Tools per esercizi Flask
RUN apt-get -qq update \
    && apt-get -qq --no-install-recommends install pip

# Pulizia
RUN apt-get -qq clean \
    && rm -rf /var/lib/apt/lists/*

# Installazione flask
COPY requirements.txt .
RUN pip install -r requirements.txt
ENV FLASK_ENV=development

# Avvio ssh
CMD /etc/init.d/ssh start && bash
