
all: up

up:
	sudo rm -rf ~/data/*
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up

down:
	docker compose -f srcs/docker-compose.yml down -v

clean: down
	docker compose -f srcs/docker-compose.yml down --rmi all

