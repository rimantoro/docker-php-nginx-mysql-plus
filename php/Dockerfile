FROM php:7.1-fpm

MAINTAINER Rosa Imantoro <rosaimantoro@gmail.com>

# ADD php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
# ADD www.conf /etc/php/7.1/fpm/pool.d/www.conf
# 
# EXPOSE 9000
# CMD ["php-fpm7.1"]

#### Common

RUN mkdir -p /usr/src/php/ext

RUN apt-get update \
    && apt-get install -y git libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mysqli opcache zip \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

#### MongoDB

RUN apt-get install -y autoconf pkg-config libssl-dev \
    && pecl install mongodb-1.4.2 \
    && docker-php-ext-install bcmath \
    && echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

#### Redis

ENV PHPREDIS_VERSION 4.0.0

RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis \
    && docker-php-ext-install redis

RUN apt-get autoremove && apt-get autoclean


#### NodeJS & JS stuffs

RUN curl -sL https://deb.nodesource.com/setup_8.x | /bin/bash - \
    && apt-get install -y nodejs \
    && npm install apidoc -g
