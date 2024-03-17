# Project Title

HackTheBox Docker ready-to-use.

Here's the revised paragraph to be added to the README.md file under the "Motivation" section:

---

## Motivation

I've recently started practicing on [HackTheBox](https://www.hackthebox.com/). Setting up a VM on my Macbook seemed like an overkill to me, so I opted to use Docker instead. However, I couldn't find any ready-to-use Dockerfiles, so I decided to compile my own, which I am excited to share with the community. 

It uses a Kali Linux image and runs an OpenVPN inside the container. With this setup, you can conveniently access the lab server directly from within the container.

--- 

## Installation

[Instructions on how to install and get the project running]

## Usage

[Instructions and examples on how to use the project]


# htb_docker

docker run -d --cap-add SYS_ADMIN -d --privileged --sysctl net.ipv6.conf.all.disable_ipv6=0 --rm htb:v1
docker exec -it {container_name} bash
openvpn /etc/openvpn/client/
