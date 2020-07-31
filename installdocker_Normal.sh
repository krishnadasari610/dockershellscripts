#!/bin/bash
#Update the apt package index
sudo yum update

sudo yum install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo yum add -

sudo yum fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo yum update

sudo yum install -y docker-ce



sudo groupadd docker
sudo usermod -aG docker $USER

sudo systemctl enable docker 

sudo yum update 
