# Use the official Alpine Linux as a base image with Linux Kernel 5.4
FROM php:8.2-apache
# image: php:8.3-apache on develpment

# Useful PHP extension installer image, copy binary into your container
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# Install php extensions
# exit on errors, exit on unset variables, print every command as it is executed
RUN set -eux; \
    install-php-extensions mysqli pdo pdo_mysql zip intl;

# RUN docker-php-ext-install pdo pdo_mysql

# allow super user - set this if you use Composer as a
# super user at all times like in docker containers
ENV COMPOSER_ALLOW_SUPERUSER=1

# obtain composer using multi-stage build
# https://docs.docker.com/build/building/multi-stage/
COPY --from=composer:2.4 /usr/bin/composer /usr/bin/composer

#Here, we are copying only composer.json and composer.lock (instead of copying the entire source)
# right before doing composer install.
# This is enough to take advantage of docker cache and composer install will
# be executed only when composer.json or composer.lock have indeed changed!-
# https://medium.com/@softius/faster-docker-builds-with-composer-install-b4d2b15d0fff
COPY ./composer.* ./

# install
RUN composer install --prefer-dist --no-dev --no-scripts --no-progress --no-interaction

# Configure Apache
# RUN sed -i 's#^DocumentRoot ".*#DocumentRoot "/var/www/localhost/htdocs"#' /etc/apache2/httpd.conf && \
#     sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf && \
#     sed -i 's#^ServerRoot ".*#ServerRoot "/etc/apache2"#' /etc/apache2/httpd.conf

# Set PHP and Apache environment variables
# ENV PHP_INI_DIR=/etc/php8 \
#     APACHE_DOCUMENT_ROOT=/var/www/localhost/htdocs

# Configure PHP
# RUN mkdir -p $PHP_INI_DIR/conf.d && \
#     echo "date.timezone = UTC" > $PHP_INI_DIR/conf.d/custom.ini

# Enable Apache modules
# RUN sed -i 's#^#LoadModule rewrite_module modules/mod_rewrite.so#' /etc/apache2/httpd.conf && \
#     sed -i 's#^#LoadModule php8_module modules/libphp8.so#' /etc/apache2/httpd.conf

# Create the necessary directories
# RUN mkdir -p /run/apache2 /var/www/localhost/htdocs

# Expose port 80
# EXPOSE 80

# Set the working directory
# WORKDIR /var/www/localhost/htdocs

# Copy your application code to the container
# COPY . /var/www/localhost/htdocs

# Install Composer dependencies
# RUN composer install --no-dev --optimize-autoloader

# Install Node.js dependencies
# RUN npm install

# Start Apache in the foreground
