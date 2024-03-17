#!/bin/sh

#IMPORTANT:
# Make sure to place this dockerfile in a directory 
# with your (username).ovpn profile from your connection path!!!

#You can change this to any debian-based distro
#FROM debian:sid
FROM kalilinux/kali-rolling:latest

# the base system
RUN apt update && \
    apt install -y --no-install-recommends build-essential file patch bzip2 xz-utils curl wget bash git openssh-client && \
    apt install -y telnet libc6 procps netbase dirmngr gnupg libssl-dev gawk bash-completion tcpdump sshpass && \
    apt install -y gdb gdbserver strace vim upx python3-dev poppler-utils ruby netcat-traditional bsdmainutils && \
    apt install -y --no-install-recommends libffi-dev && \
    apt install -y radare2 && \
    apt install -y --no-install-recommends binwalk && \
    apt install -y john foremost sqlmap && \
    apt clean

# set locales to UTF-8
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8 && \
    apt-get clean
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

RUN apt install -y openvpn

#this places the config where it needs to be in /etc/
ADD . /etc/openvpn/client/

ENTRYPOINT ["openvpn"]