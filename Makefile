.PHONY: build up down rm_all re 

DIR_SRCS	= ./srcs/docker-compose.yml
PATH_DATABASE	= ~/data/database
PATH_WORDPRESS	= ~/data/wordpress


build:
	sudp docker-compose -f $(DIR_SRCS) build
up:
	./.script_env.sh
	sudo docker-compose -f $(DIR_SRCS) up

down:
	sudo docker-compose -f $(DIR_SRCS) down -v

rm_all: 
	$(MAKE) down;\
	sudo rm -rf $(PATH_DATABASE);\
	sudo rm -rf $(PATH_WORDPRESS);\
	rm srcs/.env;\
	sudo docker rmi  $$(sudo docker image ls -aq)

re: rm_all 
	$(MAKE) up

help:
	@echo "Available commands:"
	@echo "  make help     : Display this help message"
	@echo "  make build    : Build the project or container images"
	@echo "  make up       : Start the containers using docker-compose"
	@echo "  make down     : Stop and remove the containers"
	@echo "  make rm_all   : Stop and remove containers & volumes"
	@echo "  make re       : re-build and run services"
#	@echo "  make stop     : Stop the running containers"
#	@echo "  make rm       : Remove stopped containers"
#	@echo "  make destroy  : Stop and remove all containers and volumes"
#
#IMAGE_BASE	= nginx
#run:
#	docker-compose -f $(DIR_SRCS) run $(IMAGE_BASE)
#stop:
#	docker-compose -f $(DIR_SRCS) stop
#rm:
#	docker-compose -f $(DIR_SRCS) rm
#rmvol:
#	docker volume rm $(VOLUMES)
#destroy:
#	docker-compose -f $(DIR_SRCS) destroy
