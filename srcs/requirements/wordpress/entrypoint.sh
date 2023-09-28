#!/bin/sh


download_wp_cli () {

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp cli update
}

download_wp () {

	cd /var/www/wordpress
	wp core download --allow-root 
	# setup www.conf 
	find / -name www.conf -type f \
	-exec sed -i -e 's/\b;clear_env = [^ ]*/clear_env = no/g' \
	-e 's/\blisten = [^ ]*/listen = wordpress:9000/g' {} \;
}

setup_wp () {
	
	wp config create --allow-root \
		--dbname="${MYSQL_DATABASE}" \
		--dbuser="${MYSQL_USER}" \
		--dbpass="${MYSQL_PASSWORD}" \
		--dbhost="mariadb:3306" 
		#--path="wordpress"

	wp core install --url="https://localhost" \
		--title="test_site" \
		--admin_user="first_user" \
		--admin_password="first_password" \
		--admin_email="first@gmail.ch"
		#--path="wordpress"
}

create_other_user() {

	wp user create second_user  second@gmail.ch --role='author' \
		--user_pass='second_password'
}

deamon_process () { 
	php-fpm81 -F 
}

main () {

	download_wp_cli
	download_wp
	setup_wp
	create_other_user
	deamon_process
}

main
