#!/bin/bash
sudo apt update && sudo apt -y upgrade
sudo apt install -y apache2
echo "<h1>Hello, World!</h1>" > /var/www/html/inde.html
sudo service apache2 start