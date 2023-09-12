FROM alpine:3.17

RUN apk update && apk upgrade 
RUN apk add --no-cache wget vim fcgi php php-cgi php-cli \
	php-common php-curl php-fpm php-gd php-iconv php-mbstring \
	php-mysqli php-openssl php-pdo php-pdo_mysql php-phar \
	php-tokenizer php-zlib mariadb-client

# -P path download && /var/www => this path will be used by nginx too
#RUN wget https://fr.wordpress.org/wordpress-6.3-fr_FR.tar.gz -P /var/www
#
#RUN cd /var/www && tar -xzf wordpress-6.3-fr_FR.tar.gz \
# && rm wordpress-6.3-fr_FR.tar.gz && chown -R root:root wordpress
#
## modification config file [www.conf] directly on container
#RUN find / -name www.conf -type f \
# -exec sed -i -e 's/\b;clear_env = [^ ]*/clear_env = no/g' \
# -e 's/\blisten = [^ ]*/listen = wordpress:9000/g' {} \; 
#RUN cd /
#
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
#RUN wp core download --allow-root

RUN mkdir /deamon_script
COPY entrypoint.sh /deamon_script
RUN chmod +x /deamon_script/entrypoint.sh

# config wordpress [wp-config.php] (database bind)
#ARG file="wp-config.php"
#
#ARG MYSQL_DB
#ARG MYSQL_U
#ARG MYSQL_P
#
#RUN cd /var/www/wordpress && cp wp-config-sample.php $file \
# && sed -i -e "s/'votre_nom_de_bdd'/'$MYSQL_DB'/g" \
# -e "s/'votre_utilisateur_de_bdd'/'$MYSQL_U'/g" \
# -e "s/'votre_mdp_de_bdd'/'$MYSQL_P'/g" \
# -e "s/'localhost'/'mariadb:3306'/g" $file
#

ENTRYPOINT ["/deamon_script/entrypoint.sh"]
