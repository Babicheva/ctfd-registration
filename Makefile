IMAGE_NAME := flask-app

CONTAINER_NAME := web

COMPOSE_DEV := docker-compose.dev.yml
COMPOSE_PROD := docker-compose.prod.yml

COMPOSE := docker compose -f

APP_DIR := .

.PHONY: help build up-dev down-dev up-prod down-prod rebuild-dev shell

help:
	 @echo "Доступные команды:"
	 @echo ""
	 @echo "  # Development:"
	 @echo "  build-dev      - Сборка приложения в режиме разработки."
	 @echo "  up-dev         - Запуск приложения в режиме разработки (docker-compose.dev.yml)."
	 @echo "  down-dev       - Остановка приложения в режиме разработки."
	 @echo "  rebuild-dev    - Пересборка образа и перезапуск контейнеров в режиме разработки."
	 @echo "  logs-dev       - Просмотр логов приложения в режиме разработки."
	 @echo "  shell          - Подключение к контейнеру в режиме разработки (bash)."
	 @echo ""
	 @echo "  # Production:"
	 @echo "  build-prod     - Сборка приложения в режиме продакшен."
	 @echo "  up-prod        - Запуск приложения в режиме продакшен (docker-compose.prod.yml)."
	 @echo "  down-prod      - Остановка приложения в режиме продакшен."
	 @echo "  rebuild-prod    - Пересборка образа и перезапуск контейнеров в режиме разработки."
	 @echo ""
	 @echo "  # General:"
	 @echo "  help           - Вывод этого сообщения."
	 @echo ""
	 @echo "Переменные:"
	 @echo "  APP_DIR        - Директория приложения (по умолчанию: '.')."

build-dev:
	 $(COMPOSE) $(COMPOSE_DEV) up -d --build

up-dev:
	 $(COMPOSE) $(COMPOSE_DEV) up -d

down-dev:
	 $(COMPOSE) $(COMPOSE_DEV)  down


build-prod:
	 $(COMPOSE) $(COMPOSE_PROD) up -d --build

up-prod:
	 $(COMPOSE) $(COMPOSE_PROD) up -d

down-prod:
	 $(COMPOSE) $(COMPOSE_PROD) down

rebuild-dev: down-dev build-dev up-dev
rebuild-prod: down-prod build-prod up-prod


logs-dev:
	 $(COMPOSE) $(COMPOSE_DEV)  logs -f

shell:
	 docker exec -it $(CONTAINER_NAME) bash
