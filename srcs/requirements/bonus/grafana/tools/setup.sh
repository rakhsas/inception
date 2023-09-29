#!/bin/bash


    until mysqladmin -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ping; do
        echo "Waiting for MariaDB to start..."
        sleep 5
    done

    sed -i 's/;type = sqlite3/type = mysql/' /etc/grafana/grafana.ini
    sed -i 's/;host = 127.0.0.1:3306/host = ${DB_HOST}:3306/' /etc/grafana/grafana.ini
    sed -i 's/;name = grafana/name = ${DB_NAME}/' /etc/grafana/grafana.ini
    sed -i 's/;user = root/user = ${DB_USER}/' /etc/grafana/grafana.ini
    sed -i 's/;password =/password = ${DB_PASSWORD}/' /etc/grafana/grafana.ini




    grafana-cli admin reset-admin-password ${DB_PASSWORD}

    /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
