FROM ubuntu:focal

WORKDIR /app

RUN apt-get -qq update \
    && apt-get -qq --no-install-recommends install nano \
    && apt-get -qq --no-install-recommends install openssh-server \
    && apt-get -qq --no-install-recommends install sudo \
    && apt-get -qq clean \
    && rm -rf /var/lib/apt/lists/*

# Setup the default user.
RUN useradd -rm -d /home/user -s /bin/bash -g root -G sudo user
RUN echo 'user:user' | chpasswd

RUN ssh-keygen -A -v

RUN apt-get -qq update \
    && apt-get -qq --no-install-recommends install pip \
    && apt-get -qq --no-install-recommends install git \
    && apt-get -qq --no-install-recommends install make 
COPY requirements.txt .
RUN pip install -r requirements.txt

ENV FLASK_ENV=development
CMD /etc/init.d/ssh start && bash
