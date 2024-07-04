FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y mariadb-server

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 755 /var/run/mysqld

COPY tools/mdb.sh .

RUN chmod +x ./mdb.sh

CMD ["sh", "mdb.sh"]
