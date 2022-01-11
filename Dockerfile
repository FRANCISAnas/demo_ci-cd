FROM ubuntu:16.04

# Description of project
LABEL author="Student"
LABEL description="Password generator on linux server"

# Install Apache, PHP
RUN apt update && \
    apt install -y apache2 \
        php \
        libapache2-mod-php7.0 \
        libapache2-mod-php && \
    update-alternatives --set php /usr/bin/php7.0 && \
    a2enmod php7.0 && \
    service apache2 start

#COPY html to /var/www/html
COPY html /var/www/html
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Open 80 port
EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Execute
# docker build -t apache:v1 .
# docker run -ti -d -p 80:80 --name=apache apache:v1
