# Makefile

# Variables
NGINX_IMAGE = nginx-image
WORDPRESS_IMAGE = wordpress-image
MARIADB_IMAGE = mariadb-image

# Build Docker images using Docker Compose
build:
	docker-compose -f srcs/docker-compose.yml build

# Run the Docker containers using Docker Compose
run:
	docker-compose -f srcs/docker-compose.yml up -d

# Stop and remove the Docker containers using Docker Compose
stop:
	docker-compose -f srcs/docker-compose.yml down

# Remove the Docker images using Docker Compose
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

# Add other tasks and commands as needed
