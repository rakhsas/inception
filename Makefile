
all: up

up: build
	docker compose -f srcs/docker-compose.yml up

build:
	docker compose -f srcs/docker-compose.yml build

down:
	docker compose -f srcs/docker-compose.yml down -v

clean: down remove
	docker compose -f srcs/docker-compose.yml down --rmi all

remove:
	sudo rm -rf ~/data/database/*
	sudo rm -rf ~/data/wordpress/*
