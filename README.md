# htb_docker

docker run -d --cap-add SYS_ADMIN -d --privileged --sysctl net.ipv6.conf.all.disable_ipv6=0 --rm htb:v1
docker exec -it {container_name} bash
openvpn /etc/openvpn/client/
