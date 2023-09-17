FROM debian:12

RUN apt update; \
    apt install -y php8.2 php-mysqli php-fpm mariadb-client curl sendmail

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d
COPY ./conf /var/www/

EXPOSE 9000

CMD ["bash", "/var/www/setup.sh"]