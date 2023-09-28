#!/bin/bash

user=rmamison

create_env() {
	cat << __EOF__ > srcs/.env 
LOGIN=$user
DOMAIN_NAME=${user}.42.ch

# MYSQL SETUP
MYSQL_DATABASE=DB_INCEPTION
MYSQL_ROOT_PASSWORD=root_password
MYSQL_USER=$user
MYSQL_PASSWORD=${user}_password

__EOF__
echo -e "\e[32mThe File .env has been created\e[0m"
}

add_domain_name() {
	sudo sed -i -e '/127\.0\.0\.1/ s/$/ '$user'.42.ch/' \
		-e '/127\.0\.0\.1/ s/$/ '$user'.42.fr/' /etc/hosts

    	echo -e "\e[32mThe Domain name: \n\t$user.42.fr\n\t$user.42.ch \
		\nhas been added in hosts\e[0m"
}

if [ ! -f "srcs/.env" ]; then
    create_env
else
    echo -e "\e[31mFile .env already exist.\e[0m"
fi

if grep -q "127\.0\.0\.1.*$user" "/etc/hosts"; then
    echo -e "\e[31mDomain name is already done in hosts file\e[0m"
else
    add_domain_name
fi

mkdir -p /home/$user/data/wordpress
mkdir -p /home/$user/data/database

