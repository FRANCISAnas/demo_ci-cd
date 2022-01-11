# Password generator

Password generator for Ubuntu 16.04+ that use /dev/urandom and PHP 7.0

## Setup and run Application:

- `git clone` repository_name
- `cd /Docker-app/Docker-password_generator`
- `docker build -t apache:v1 .`
- `docker run -ti -p 80:80 --name=apache apache:v1`
- `ip -a` Find Docker IP address (172.17.X.X)
- Open on useragent`http://172.17.X.X`
