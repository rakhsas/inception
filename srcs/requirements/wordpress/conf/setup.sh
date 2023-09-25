#!/bin/bash

echo -n "Installing WP-CLI..................................."

chown -R www-data /var/www/wordpress
chmod -R 775 /var/www/wordpress




mkdir -p /run/php/
touch /run/php/php8.2-fpm.pid
wait_for_mariadb() {
  until mysqladmin -h mariadb -u rakhsas -phelloworld ping; do
    echo "Waiting for MariaDB to start..."
    sleep 5
  done
  if [ ! -f /var/www/wordpress/wp-config.php ]; then
      curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
      chmod +x wp-cli.phar
      mv wp-cli.phar /usr/local/bin/wp

      cd /var/www/wordpress
      wp core download --allow-root

      mv /var/www/wp-config.php /var/www/wordpress/
      wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${WORDPRESS_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL}
      wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root

      # chown -R www-data:www-data /var/www/wordpress/wp-content
      # chmod -R 755 /var/www/wordpress/wp-content
      
      wp theme install astra --activate --allow-root
      wp plugin install redis-cache --activate --allow-root
      wp plugin update --all --allow-root
      wp plugin activate redis-cache --allow-root
      wp redis enable --allow-root
      chown -R www-data:www-data /var/www/wordpress

      # Adjust directory permissions to 755
      find /var/www/wordpress -type d -exec chmod 755 {} \;

      # Adjust file permissions to 644
      find /var/www/wordpress -type f -exec chmod 644 {} \;

      # Ensure that wp-content/uploads directory is writable
      chown -R www-data:www-data /var/www/wordpress/wp-content/uploads
      chmod -R 755 /var/www/wordpress/wp-content/uploads
      echo "Wordpress Launched SUCCESSFULLY"
  fi
}
wait_for_mariadb

/usr/sbin/php-fpm8.2 -F