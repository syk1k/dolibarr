# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy your PHP application code into the container
COPY htdocs/. .

#RUN chmod 777 _data
RUN chmod 777 conf/conf.php

# Install PHP extensions and other dependencies
RUN apt-get update && apt-get install -y libpng-dev nano libzip-dev libc-client-dev libkrb5-dev libicu-dev

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install pdo pdo_mysql gd mysqli exif zip calendar imap

RUN docker-php-ext-install  intl

# Expose the port Apache listens on
EXPOSE 80

# Start Apache when the container runs
CMD ["apache2-foreground"]