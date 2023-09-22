#!/bin/bash

user=rmamison
create_env() {
	cat << __EOF__ > srcs/.env 
LOGIN=$user
DOMAIN_NAME=$user.42.ch

# MYSQL SETUP
MYSQL_DATABASE=DB_INCEPTION
MYSQL_ROOT_PASSWORD=root_password
MYSQL_USER=$user
MYSQL_PASSWORD=$user_password
__EOF__
}

add_domain_name() {
	sudo sed -i -e '/127\.0\.0\.1/ s/$/ '$user'.42.ch/' \
		-e '/127\.0\.0\.1/ s/$/ '$user'.42.fr/' /etc/hosts
}

if [ ! -f "srcs/.env" ]; then
    create_env
else
    echo "File .env already exist."
fi

if grep -q "127\.0\.0\.1.*$user" "/etc/hosts"; then
    echo "Domain name is already done in hosts file."
else
    add_domain_name
fi

mkdir -p /home/$USER/data/wordpress
mkdir -p /home/$USER/data/database

