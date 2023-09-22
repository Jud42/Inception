.PHONY: help build rmvol up down stop rm destroy rm_all re 

DIR_SRCS	= ./srcs/docker-compose.yml

build:
	docker-compose -f $(DIR_SRCS) build

up:
	./.script_env.sh
	docker-compose -f $(DIR_SRCS) up

down:
	docker-compose -f $(DIR_SRCS) down

stop:
	docker-compose -f $(DIR_SRCS) stop

rm:
	docker-compose -f $(DIR_SRCS) rm

rmvol:
	docker volume rm $(VOLUMES)


destroy:
	docker-compose -f $(DIR_SRCS) destroy

rm_all:
	docker rm $$(docker container ls -aq)
	docker rmi  $$(docker image ls -aq)
	docker volume rm $$(docker volume ls -q)

re: stop rm_all build

help:
	@echo "Available commands:"
	@echo "  make help     : Display this help message"
	@echo "  make build    : Build the project or container images"
	@echo "  make up       : Start the containers using docker-compose"
	@echo "  make down     : Stop and remove the containers"
	@echo "  make stop     : Stop the running containers"
	@echo "  make rm       : Remove stopped containers"
	@echo "  make destroy  : Stop and remove all containers and volumes"


