# os base
FROM alpine:3.17

# install package util
RUN apk update && apk upgrade && apk add nginx vim

#TLS set up
RUN apk add openssl
RUN mkdir -p /etc/nginx/ssl
 # creation certificat TSL/SSL: key word \
 #	[req] the format (PKCS#10) 
 #	[-x509] the certificat type
 #	[-nodes] without password
 #	[-out] [/path/...] path to save the certificat
 #	[-keyout] [/path/...] path to save the key
 #	[-subj] pre-fills the required information

RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \ 
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=localhost/UID=login"
#-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

# creation file config 
COPY conf/nginx.conf /etc/nginx/nginx.conf

# test 
#RUN mkdir -p /var/www/
#COPY html/index.html /var/www/html/index.html
#RUN chmod 755 /var/www/wordpress
#RUN chown -R nginx:nginx /var/www/wordpress

#This will launch NGINX in the foreground 
# so that the container does not stop.
CMD ["nginx", "-g", "daemon off;"]
