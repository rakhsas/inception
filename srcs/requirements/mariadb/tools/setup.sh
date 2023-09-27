#!/bin/bash
service mariadb start 
sleep 1
  mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
  mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
  mariadb -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%';"
  mariadb -e "FLUSH PRIVILEGES;"
  mysqladmin -u root shutdown
  # touch /var/lib/mysql/testoos
  mysqld_safe --bind-address=0.0.0.0
