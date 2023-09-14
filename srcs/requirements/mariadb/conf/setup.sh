#!/bin/bash

# Get values from environment variables
DB_NAME="$DB_NAME_ENV"
DB_USER="$DB_USER_ENV"
DB_PASSWORD="$DB_PASSWORD_ENV"

# Check if any of the required environment variables are missing
if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASSWORD" ]; then
  echo "One or more required environment variables are missing."
  exit 1
fi

# Generate SQL commands
SQL_COMMANDS="CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'test42';"

# Save SQL commands to a file
echo "$SQL_COMMANDS" > db_setup.sql
echo "Executed!!!!"
# Execute the SQL file using MySQL
# mysql -u root -p < db_setup.sql
