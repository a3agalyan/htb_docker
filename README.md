# HackTheBox Docker ready-to-use.

## Motivation

I've recently started practicing on [HackTheBox](https://www.hackthebox.com/). Setting up a VM on my Macbook seemed like an overkill to me, so I decided to use Docker instead. However, I couldn't find any ready-to-use Dockerfiles, so I decided to compile my own, which I am excited to share with the community. 

It uses a Kali Linux image and runs an OpenVPN inside the container. With this setup, you can conveniently access the lab server directly from within the container.

---

## Installation

Follow these simple steps to get set up:

1. Place `htb.dockerfile` and `{file_name}.ovpn` in the same directory.
2. Execute the build command(takes around 8 min to complete):  
   ```
   docker build -f htb.dockerfile -t htb:v0 .
   ```
3. Replace `{file_name}.ovpn` with your OpenVPN file name and start the container with the run command:  
   ```
   docker run -d --cap-add SYS_ADMIN -d --privileged \
   --sysctl net.ipv6.conf.all.disable_ipv6=0 --rm -it htb:v0 /etc/openvpn/client/{file_name}.ovpn
   ```

---

## Usage
At this point your container is already in internal Lab's VPN.
Open new terminal tab and access container bash:

   ```
   docker exec -it {container_name} bash
   ```
Let's go!
   ```
   ping 10.129.19.37
   ```

---

## PS

- Don't forget to stop container after you're done.

- Some of the packages might be missing from my build. I'll keep adding them as 
I progress in learning about the platform. For details, check the Dockerfile.
