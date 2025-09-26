# Variables
DOCKER_COMPOSE = docker-compose
ENV_FILE = .env
COMPOSE_FILE = docker-compose.yml

# Colors for better output
GREEN = \033[0;32m
RED = \033[0;31m
YELLOW = \033[0;33m
NC = \033[0m # No Color

include .env
export

.PHONY: help build up down restart logs clean ps shell-frontend shell-cms status stop start install-frontend install-cms backup-sqlite restore-sqlite list-backups

help:
	@echo "$(YELLOW)Available commands:$(NC)"
	@echo "$(GREEN)make build$(NC)          - Build all services"
	@echo "$(GREEN)make up$(NC)            - Start all services in detached mode"
	@echo "$(GREEN)make down$(NC)          - Stop and remove all containers"
	@echo "$(GREEN)make restart$(NC)       - Restart all services"
	@echo "$(GREEN)make logs$(NC)          - Show logs from all services"
	@echo "$(GREEN)make clean$(NC)         - Stop containers and remove volumes"
	@echo "$(GREEN)make ps$(NC)            - Show running containers"
	@echo "$(GREEN)make status$(NC)        - Show container status"
	@echo "$(GREEN)make stop$(NC)          - Stop services without removing"
	@echo "$(GREEN)make start$(NC)         - Start stopped services"
	@echo "$(GREEN)make shell-frontend$(NC) - Open shell in frontend container"
	@echo "$(GREEN)make shell-cms$(NC)     - Open shell in CMS container"
	@echo "$(GREEN)make install-frontend$(NC) - Install frontend dependencies"
	@echo "$(GREEN)make install-cms$(NC)   - Install CMS dependencies"
	@echo "$(GREEN)make backup-sqlite$(NC) - Backup Strapi SQLite database"
	@echo "$(GREEN)make restore-sqlite file=backups/data_YYYYMMDD_HHMMSS.db$(NC) - Restore Strapi SQLite database from backup"
	@echo "$(GREEN)make list-backups$(NC)  - List SQLite backups"

# Check if .env file exists
check-env:
	@if [ ! -f $(ENV_FILE) ]; then \
		echo "$(RED)Error: .env file not found!$(NC)"; \
		echo "Please ensure .env file exists in the current directory"; \
		exit 1; \
	fi

# Check if docker-compose.yml exists
check-compose:
	@if [ ! -f $(COMPOSE_FILE) ]; then \
		echo "$(RED)Error: docker-compose.yml file not found!$(NC)"; \
		exit 1; \
	fi

# Build all services
build: check-compose check-env
	@echo "$(YELLOW)Building all services...$(NC)"
	@$(DOCKER_COMPOSE) build
	@echo "$(GREEN)Build completed successfully!$(NC)"

# Start all services
up: check-compose check-env
	@echo "$(YELLOW)Starting all services...$(NC)"
	@$(DOCKER_COMPOSE) up -d
	@echo "$(GREEN)Services started!$(NC)"
	@echo "$(YELLOW)Frontend: http://localhost:5173$(NC)"
	@echo "$(YELLOW)CMS/Strapi: http://localhost:1337$(NC)"

# Start with build
up-build: check-compose check-env
	@echo "$(YELLOW)Building and starting all services...$(NC)"
	@$(DOCKER_COMPOSE) up -d --build
	@echo "$(GREEN)Services started!$(NC)"

# Stop all services
down:
	@echo "$(YELLOW)Stopping all services...$(NC)"
	@$(DOCKER_COMPOSE) down
	@echo "$(GREEN)Services stopped!$(NC)"

# Stop without removing
stop:
	@$(DOCKER_COMPOSE) stop

# Start stopped services
start:
	@$(DOCKER_COMPOSE) start

# Restart all services
restart: stop start
	@echo "$(GREEN)Services restarted!$(NC)"

# Show logs for all services
logs:
	@$(DOCKER_COMPOSE) logs -f

# Show running containers
ps:
	@$(DOCKER_COMPOSE) ps

# Show container status
status: ps

# Clean - stop containers and remove volumes
clean:
	@echo "$(YELLOW)Stopping containers and removing volumes...$(NC)"
	@$(DOCKER_COMPOSE) down -v
	@echo "$(GREEN)Cleanup completed!$(NC)"

# Open shell in frontend container
shell-frontend:
	@$(DOCKER_COMPOSE) exec frontend sh

# Open shell in CMS container
shell-cms:
	@$(DOCKER_COMPOSE) exec cms sh

# Install dependencies in frontend
install-frontend:
	@echo "$(YELLOW)Installing frontend dependencies...$(NC)"
	@$(DOCKER_COMPOSE) exec frontend yarn install
	@echo "$(GREEN)Frontend dependencies installed!$(NC)"

# Install dependencies in CMS
install-cms:
	@echo "$(YELLOW)Installing CMS dependencies...$(NC)"
	@$(DOCKER_COMPOSE) exec cms yarn install
	@echo "$(GREEN)CMS dependencies installed!$(NC)"

# SQLite backup (копирует файл базы из volume/papki контейнера)
backup-sqlite:
	@echo "$(YELLOW)Creating SQLite backup...$(NC)"
	@mkdir -p backups
	@$(DOCKER_COMPOSE) cp cms:/usr/app/.tmp/data.db backups/data_$(shell date +%Y%m%d_%H%M%S).db
	@echo "$(GREEN)SQLite backup created in backups/ directory$(NC)"

# SQLite restore (восстанавливает файл базы в контейнер)
restore-sqlite:
	@if [ -z "$(file)" ]; then \
		echo "$(RED)Error: Please specify backup file (e.g., make restore-sqlite file=backups/data_YYYYMMDD_HHMMSS.db)$(NC)"; \
		exit 1; \
	fi
	@echo "$(YELLOW)Restoring SQLite database from $(file)...$(NC)"
	@$(DOCKER_COMPOSE) cp $(file) cms:/usr/app/.tmp/data.db
	@echo "$(GREEN)SQLite database restored!$(NC)"

# List SQLite backups
list-backups:
	@echo "$(YELLOW)Available SQLite backups:$(NC)"
	@ls -la backups/*.db 2>/dev/null || echo "$(YELLOW)No backups found$(NC)"