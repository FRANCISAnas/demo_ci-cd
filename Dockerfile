FROM ubuntu:16.04

# Description of project
LABEL author="Student"
LABEL description="Password generator on linux server"

# Install Apache, PHP
RUN apt update && \
    apt install -y curl \ 
        apache2 \
        php \
        libapache2-mod-php7.0 \
        libapache2-mod-php && \
    update-alternatives --set php /usr/bin/php7.0 && \
    a2enmod php7.0 && \
    service apache2 start

#COPY files and dirs
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY html /var/www/html

# Open 80 port
EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]