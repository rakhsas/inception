FROM wordpress:latest

WORKDIR /var/www/html

COPY ./php-fpm.conf /usr/local/etc/php-fpm.d/www.conf


#set the environment variables
ENV WORDPRESS_DB_HOST=mariadb
ENV WORDPRESS_DB_USER=root
ENV WORDPRESS_DB_PASSWORD=example_root_password
ENV WORDPRESS_DB_NAME=wordpress