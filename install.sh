#!/bin/bash
# exportando proxy


# cambiando source.list
echo "Cambiando source.list de archive.ubuntu.com a repos.uclv.edu.cu"
 
sed -i 's/archive.ubuntu.com/repos.uclv.edu.cu/' /etc/apt/sources.list
sed -i 's/security.ubuntu.com/repos.uclv.edu.cu/' /etc/apt/sources.list
 
# actualizando
 
apt update && sudo apt upgrade -y
 
# Instalando docker docker-compose
 
apt install docker.io docker-compose mc  -y
 
# creando daemon.json
 
bash -c 'cat << EOF > /etc/docker/daemon.json
{ 
    "registry-mirrors": [ 
    "https://docker.uclv.cu",
    "https://rw21enj1.mirror.aliyuncs.com",
    "https://dockerhub.azk8s.cn",
    "https://reg-mirror.qiniu.com",
    "https://hub-mirror.c.163.com",
    "https://docker.mirrors.ustc.edu.cn",
    "https://1nj0zren.mirror.aliyuncs.com",
    "https://quay.io",
    "https://docker.mirrors.ustc.edu.cn",
    "http://f1361db2.m.daocloud.io",
    "https://registry.docker-cn.com"
    ]
}
EOF'
sleep 10
# Reiniciando docker
echo "Reiniciando servicio docker"
service docker restart

