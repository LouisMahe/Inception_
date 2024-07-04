FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y nginx openssl


RUN mkdir -p /etc/ssl/private/
RUN chmod 755 /etc/ssl/private/

RUN openssl req -x509 -sha256 -nodes -newkey rsa:4096 -days 30\
    -subj "/C=FR/ST=IDF/L=Paris/O=42Paris/OU=Inception/CN=lmahe.42.fr/UID=lmahe"\
    -keyout /etc/ssl/private/nginx_cert.key\
    -out /etc/ssl/private/nginx_cert.crt

COPY conf/nginx.conf etc/nginx/nginx.conf

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
