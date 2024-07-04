#!/bin/bash

if [ -f "/var/www/html/wp-config.php" ];
then
    echo "Wordpress already set\n"
else
    wp core download --allow-root

    sleep 5
    wp core config --dbname=$MYSQL_DATABASE\
                    --dbhost="mariadb"\
                    --dbuser=$MYSQL_USER\
                    --dbpass=$MYSQL_PASS\
                    --allow-root

    wp core install --url="lmahe.42.fr" \
                    --title=$WP_TITLE\
                    --admin_user=$WP_ADMIN\
                    --admin_password=$WP_ADMIN_PASS\
                    --admin_email=$WP_ADMIN_EMAIL\
                    --allow-root

   wp user create $WP_USER $WP_USER_EMAIL --role=author\
                   --user_pass=$WP_USER_PASS\
                   --allow-root


fi



echo "starting php-fpm"
exec /usr/sbin/php-fpm7.4 -F;
