FROM alpine:3.17

RUN apk update && apk upgrade 
RUN apk add --no-cache wget vim fcgi php php-cgi php-cli \
	php-common php-curl php-fpm php-gd php-iconv php-mbstring \
	php-mysqli php-openssl php-pdo php-pdo_mysql php-phar \
	php-tokenizer php-zlib mariadb-client

RUN mkdir /deamon_script
COPY entrypoint.sh /deamon_script
RUN chmod +x /deamon_script/entrypoint.sh

ENTRYPOINT ["/deamon_script/entrypoint.sh"]
