#!/bin/bash
#Update the apt package index
sudo apt-get update
# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
#Update the apt package
sudo apt-get update
#Make sure you are about to install from the Docker repo instead of the default Ubuntu repo:
#apt-cache policy docker-ce
#Install the latest version of Docker CE
sudo apt-get install -y docker-ce

# Linux post-install
echo "adding docker to group"
sudo groupadd docker
sudo usermod -aG docker $USER
echo "bioSecurity^2019" | su - ${USER}
#id -nG
#sudo usermod -aG docker admin
echo "enabling docker user"
sudo systemctl enable docker 
echo "updating packages"
sudo apt-get update 
echo "installing nvidia cuda toolkit"
sudo apt install -y nvidia-cuda-toolkit

#Nvidia-Docker setup
echo "please wait..,setting up Nvidia-docker plug-in"

# Add the package repositories
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - && \
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && \
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list && \
sudo apt-get update && \
sudo apt-get install -y nvidia-docker2 && \
sudo pkill -SIGHUP dockerd

sudo reboot
