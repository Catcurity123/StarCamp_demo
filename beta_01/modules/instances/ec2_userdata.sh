#!/bin/bash

# Update and Upgrade the system
sudo apt update && sudo apt upgrade -y 

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 
# Verify the fingerprint
sudo apt-key fingerprint 0EBFCD88
 
# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 
# Update package index
sudo apt update
 
# Install Docker
sudo apt install docker-ce docker-ce-cli containerd.io -y
 
# Install Docker-compose
sudo apt install docker-compose -y
 
# Add user to docker groupx`
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
getent group | grep docker
sudo chmod 666 /var/run/docker.sock
 
 
# Install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
