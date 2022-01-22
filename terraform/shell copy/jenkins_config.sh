#!/bin/bash

sudo apt update && sudo apt -y upgrade
sudo apt install -y docker.io
# Add ubuntu to docker group
sudo usermod -aG docker,root ubuntu
mkdir ~/docker
# Its not work if you havent attached IP
# sudo scp -i ~/.ssh/password-generator.pem -r /home/student/.docker/docker-password.txt ubuntu@18.222.142.81:/home/ubuntu/docker/
sudo reboot -h now
docker pull jenkins/jenkins:2.330-alpine
docker run -d -p 8080:8080 --name=jenkins jenkins/jenkins:2.330-alpine