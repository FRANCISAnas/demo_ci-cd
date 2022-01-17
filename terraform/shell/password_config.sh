#!/bin/bash

sudo apt update && sudo apt -y upgrade
sudo apt install -y docker.io
# Add ubuntu to docker group
sudo usermod -aG docker,root ubuntu
mkdir ~/docker
# sudo scp -i ~/.ssh/password-generator.pem /home/student/.docker/docker-password.txt ubuntu@18.222.142.81:/home/ubuntu/docker/
# Its not work if you havent attached IP
sudo reboot -h now