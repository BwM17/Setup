#!/usr/bin/env bash 
#chmod +x 
#sudo ./setup.sh
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf update && sudo dnf upgrade

sudo systemctl enable --now docker 
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

firefox https://localhost:9443 


#Pre installation 

#sudo groupadd docker
#sudo usermode -aG docker $USER
