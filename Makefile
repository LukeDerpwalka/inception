ENV_FILE := ./srcs/.env
DATA := ./data
HOSTS_ENTRY := "127.0.0.1 lkreuzer.42.fr"

all: $(ENV_FILE) $(DATA) up update-hosts

up:
	@docker-compose -f ./srcs/docker-compose.yml --env-file $(ENV_FILE) up -d --build

update-hosts:
	@if grep -qF $(HOSTS_ENTRY) /etc/hosts; then \
        echo "Host entry already exists"; \
    else \
        echo $(HOSTS_ENTRY) | sudo tee -a /etc/hosts; \
        echo "Host entry added successfully"; \
    fi

down:
	@docker-compose -f ./srcs/docker-compose.yml down


fclean:
	@rm -rf $(HOME)/data/wordpress_db
	@rm -rf $(HOME)/data/wordpress_files
	@docker system prune --all --force --volumes
	@docker volume prune --force
	@docker network prune --force
	@docker volume rm `docker volume ls -q`
	@echo "MADE CLEAN"

$(ENV_FILE):
	@echo "Please create the .env file at $(ENV_FILE) with the required environment variables:"
	@echo "# MySQL/MariaDB"
	@echo "DB_DATABASE="
	@echo "DB_HOSTNAME="
	@echo "DB_USER="
	@echo "DB_PASSWORD="
	@echo "# WP Admin"
	@echo "WP_ADMIN_USR="
	@echo "WP_ADMIN_EMAIL="
	@echo "WP_ADMIN_PWD="
	@echo "# WP User"
	@echo "WP_USER_NAME="
	@echo "WP_USER_EMAIL="
	@echo "WP_USER_PASSWORD="
	@exit 1
	
$(DATA):
	mkdir -p $(HOME)/data/wordpress_db
	mkdir -p $(HOME)/data/wordpress_files

