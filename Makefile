all:
	mkdir -p /home/lmahe/data/mariadb
	mkdir -p /home/lmahe/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

build:
	mkdir -p /home/lmahe/data/mariadb
	mkdir -p /home/lmahe/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build

launch:
	docker compose -f ./srcs/docker-compose.yml up -d


logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker compose -f ./srcs/docker-compose.yml down

fclean: clean
	@sudo rm -rf /home/lmahe/data/mariadb/*
	@sudo rm -rf /home/lmahe/data/wordpress/*
	@docker volume rm mariadb
	@docker volume rm wordpress
	@docker system prune -af

re: fclean all

