#!/bin/bash
dpkg -l | grep -i docker
echo "bioSecurity^2019" | sudo apt-get purge -y docker-engine docker docker.io docker-ce

echo "bioSecurity^2019" | sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce
sudo rm -rf /var/lib/docker /etc/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
sudo snap remove docker
echo "Docker uninstalled successfully"
echo "No command found with" | docker -v
sudo reboot


