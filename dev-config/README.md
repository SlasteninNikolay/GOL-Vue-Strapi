# Development Docker Compose

## Быстрый старт

1. **Запуск окружения для разработки:**
   ```bash
   docker-compose -f dev-config/docker-compose.yml up --build
   ```

2. **Frontend (Vite) будет доступен по адресу:**  
   http://localhost:5173

3. **Strapi (CMS) будет доступен по адресу:**  
   http://localhost:1337

---

## Структура

- **dev-config/Dockerfile.cms** — Dockerfile для Strapi (development)
- **dev-config/Dockerfile.frontend** — Dockerfile для фронта (development)
- **dev-config/docker-compose.yml** — основной compose-файл для разработки

---

## Особенности

- Используются volume для "горячей" перезагрузки кода (hot reload).
- node_modules вынесены в отдельные volume, чтобы не конфликтовать с локальными зависимостями.
- Все переменные окружения берутся из `.env` файла или определяются в системе.
- Можно использовать SQLite (по умолчанию) или MySQL (раскомментируйте секцию db и переменные).

---

## Переменные окружения

Создайте файл `.env` в корне проекта или используйте переменные окружения вашей системы.  
Пример:

```env
APP_KEYS=dev_app_keys
API_TOKEN_SALT=dev_api_token_salt
ADMIN_JWT_SECRET=dev_admin_jwt_secret
TRANSFER_TOKEN_SALT=dev_transfer_token_salt

NODE_ENV=development

STRAPI_URL=http://localhost:1337
STRAPI_API_URL=http://localhost:1337/api
STRAPI_TOKEN=dev_token

VUE_PORT=5173
HOST=0.0.0.0
```

---

## Остановка

```bash
docker-compose -f dev-config/docker-compose.yml down
```

---

## Примечания

- Для работы с MySQL раскомментируйте секцию `db` и соответствующие переменные.
- Все изменения в коде frontend и cms сразу видны благодаря volume.
- Для production используйте файлы из папки `prod-config`.

---

## Описание команд Makefile

- make build	Собрать все сервисы (docker-compose build)
- make up	Запустить все сервисы в фоне (docker-compose up -d)
- make up-build	Собрать и запустить все сервисы (docker-compose up -d --build)
- make down	Остановить и удалить все контейнеры (docker-compose down)
- make stop	Остановить сервисы без удаления контейнеров
- make start	Запустить ранее остановленные сервисы
- make restart	Перезапустить все сервисы
- make logs	Показать логи всех сервисов
- make ps	Показать список запущенных контейнеров
- make status	Показать статус контейнеров
- make clean	Остановить контейнеры и удалить все volumes
- make shell-frontend	Открыть shell в контейнере frontend
- make shell-cms	Открыть shell в контейнере cms
- make install-frontend	Установить зависимости во frontend-контейнере
- make install-cms	Установить зависимости в cms-контейнере
- make backup-sqlite	Создать резервную копию базы данных Strapi (SQLite) в папке backups/
- make restore-sqlite file=backups/data_YYYYMMDD_HHMMSS.db	Восстановить базу данных Strapi (SQLite) из указанного файла
- make list-backups	Показать список резервных копий базы данных (SQLite)
- make help	Показать список всех доступных команд