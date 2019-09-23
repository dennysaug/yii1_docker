#!/bin/bash

if [ ! -d $(pwd)/vendor ]; then
    docker-php-ext-install pdo_mysql
    apt-get update &&  \
    apt-get install -y libzip-dev libssl-dev git unzip && \
    curl -s https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer  
fi
if [ "$INSTALL_VENDOR" = "y" ]; then
    #sed 's/DB_HOST=127.0.0.1/DB_HOST=database/' .env.example > .env && \
    #chmod 777 .env && \
    #chmod 777 -R storage && \
    composer install #&& \
    #chmod 777 -R /opt/vendor
    #if [ "$(cat .env | grep -w 'APP_KEY=' | cut -d = -f 1)" = APP_KEY ]; then
        #php artisan key:generate
    #fi
fi
docker-php-entrypoint php-fpm


# remove all
# docker container prune -f && docker rmi $(docker images -q) -f && sudo rm -rf vendor/ .env