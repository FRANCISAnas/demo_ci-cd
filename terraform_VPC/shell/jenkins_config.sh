#!/bin/bash

sudo apt update && sudo apt -y upgrade
sudo apt install -y docker.io
# Add ubuntu to docker group
sudo usermod -aG docker,root ubuntu
mkdir ~/docker
sudo docker pull jenkins/jenkins:2.330-alpine
sudo docker run -d -p 8080:8080 --name=jenkins jenkins/jenkins:2.330-alpine