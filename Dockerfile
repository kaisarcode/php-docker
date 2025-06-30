FROM ubuntu:22.04
ARG PHP_VERSION='8.1'
ARG DEBIAN_FRONTEND=noninteractive

# Install system
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils build-essential
RUN apt-get install -y software-properties-common

# Install PHP
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y php${PHP_VERSION}

# Install Apache
RUN apt-get install -y vim curl unzip apache2
RUN apt-get install -y libapache2-mod-php${PHP_VERSION}
RUN apt-get install -y php${PHP_VERSION}-cli php${PHP_VERSION}-common

# Install PHP extensions
RUN apt-get install -y php${PHP_VERSION}-gd
RUN apt-get install -y php${PHP_VERSION}-zip
RUN apt-get install -y php${PHP_VERSION}-xml
RUN apt-get install -y php${PHP_VERSION}-curl
RUN apt-get install -y php${PHP_VERSION}-mysql
RUN apt-get install -y php${PHP_VERSION}-mbstring
RUN apt-get install -y php${PHP_VERSION}-simplexml
RUN apt-get install -y imagemagick php${PHP_VERSION}-imagick

# install SQLite
RUN apt-get install -y sqlite3

# Start service
RUN a2enmod rewrite
RUN service apache2 restart

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

# Setup filesystem
COPY ./www /var/www/html:rw
COPY ./.vhost /etc/apache2/sites-available/000-default.conf
WORKDIR /var/www/html

# Set write permissions
RUN sed -ri 's/^www-data:x:82:82:/www-data:x:1000:50:/' /etc/passwd
RUN chown -R www-data:www-data /var/www/html

# Execute
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
