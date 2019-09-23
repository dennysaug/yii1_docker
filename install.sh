#!/bin/bash

if [ ! -d $(pwd)/vendor ]; then
    docker-php-ext-install pdo_mysql
    apt-get update &&  \
    apt-get install -y libzip-dev libssl-dev git unzip && \
    curl -s https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer &&
    composer install
fi

docker-php-entrypoint php-fpm


# remove all
# docker container prune -f && docker rmi $(docker images -q) -f && sudo rm -rf vendor/ .env