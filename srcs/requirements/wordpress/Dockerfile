FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y wget
RUN apt install -y php7.4 php-fpm php-mysql mariadb-client
RUN apt install -y net-tools

RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/wpsetup.sh /usr/local/bin/wpsetup.sh

RUN chmod 755 /usr/local/bin/wpsetup.sh

EXPOSE 9000

WORKDIR /var/www/html

CMD ["sh", "/usr/local/bin/wpsetup.sh"]
