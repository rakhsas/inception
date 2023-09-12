# Makefile

# Variables
NGINX_IMAGE = nginx-image
WORDPRESS_IMAGE = wordpress-image
MARIADB_IMAGE = mariadb-image

# Build Docker images using Docker Compose
all: up

# Run the Docker containers using Docker Compose
up:
	docker-compose -f srcs/docker-compose.yml up -d --build

# Stop and remove the Docker containers using Docker Compose
down:
	docker-compose -f srcs/docker-compose.yml down -v
# docker-compose -f srcs/docker-compose.yml down


# Remove the Docker images using Docker Compose
clean: down
	docker-compose -f srcs/docker-compose.yml down --rmi all

# Add other tasks and commands as needed
