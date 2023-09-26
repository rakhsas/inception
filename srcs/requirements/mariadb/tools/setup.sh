#!/bin/bash

# Start MariaDB
# mysqld --user=mysql &
# sleep 2
# Function to wait for MariaDB to start
wait_for_mariadb() {
  until mysqladmin ping; do
    echo "Waiting for MariaDB to start..."
    sleep 5
  done
  if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASSWORD" ] || [ -z "$MYSQL_ROOT_PASSWORD" ] ; then
    echo "One or more required environment variables are missing."
    exit 1
  fi
  mysql -u "root" -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
  mysql -u "root" -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
  mysql -u "root" -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
  mysql -u "root" -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
  mysql -u "root" -p"$MYSQL_ROOT_PASSWORD" -e "SHOW GRANTS FOR '$DB_USER'@'%';"

}


# Wait for MariaDB to start
wait_for_mariadb &
# Create the database and user, grant privileges, and flush privileges
# echo "Success !!!";
# tail -f /dev/null
# Exit the script
mysqld --user=mysql
