#!/bin/bash

cat << __EOF__ > .env 
LOGIN=rmamison
DOMAIN_NAME=rmamison.42.fr

# certificates
CERTS_=./XXX

# MYSQL SETUP
MYSQL_DATABASE=DB_INCEPTION
MYSQL_ROOT_PASSWORD=root_password
MYSQL_USER=rmamison
MYSQL_PASSWORD=password
__EOF__
