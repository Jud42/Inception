FROM alpine:3.17

RUN apk update && apk upgrade 
RUN apk add --no-cache mariadb mariadb-client vim


RUN mkdir data && mkdir -p /var/run/mysqld \
 && chown -R mysql:mysql /var/run/mysqld \
 && chmod 777 /var/run/mysqld 

COPY conf/my.cnf /etc/my.cnf
COPY conf/init.sql /data/init.sql

ARG MYSQL_DB
ARG MYSQL_U
ARG MYSQL_P
ARG MYSQL_RP

RUN sed -i "s/db/$MYSQL_DB/g" /data/init.sql
RUN sed -i "s/user/$MYSQL_U/g" /data/init.sql
RUN sed -i "s/pass/$MYSQL_P/g" /data/init.sql
RUN sed -i "s/root_pass/$MYSQL_RP/g" /data/init.sql

#if you dont specify the user in configuration
# by default root will used
# but idealy it's better to use user system (mysql)
RUN mariadb-install-db \
	--datadir=/var/lib/mysql
	#--user=mysql \ already specified in => my.cnf
	#--basedir=/usr \

ENTRYPOINT ["mariadbd", "-u", "mysql", "--init-file", "/data/init.sql"]
