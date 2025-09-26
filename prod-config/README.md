# Production Docker Compose

## Быстрый старт

1. **Соберите и запустите сервисы:**
   ```bash
   docker-compose -f prod-config/docker-compose.yml up --build -d
   ```

2. **Strapi будет доступен по адресу:**  
   http://localhost:1337

3. **Frontend будет доступен по адресу:**  
   http://localhost

---

## Структура

- **prod-config/Dockerfile.cms** — Dockerfile для Strapi (production)
- **prod-config/Dockerfile.frontend** — Dockerfile для фронта (production)
- **prod-config/docker-compose.yml** — основной compose-файл для production

---

## Переменные окружения

Все необходимые переменные для Strapi и фронта уже прописаны в секции `environment` внутри `docker-compose.yml`:

```yaml
    environment:
      # Strapi secrets
      APP_KEYS: "your_app_keys"
      API_TOKEN_SALT: "your_api_token_salt"
      ADMIN_JWT_SECRET: "your_admin_jwt_secret"
      TRANSFER_TOKEN_SALT: "your_transfer_token_salt"

      # Node env
      NODE_ENV: "production"

      # SQLite config
      DATABASE_CLIENT: "sqlite"
      DATABASE_FILENAME: ".tmp/data.db"
      DATABASE_SSL: "false"
```

**Измените значения на свои реальные секреты перед деплоем!**

---

## Хранение данных

- Для Strapi монтируется папка `public/uploads` (загрузка файлов) и `.tmp` (база данных SQLite).
- После пересборки контейнера данные сохраняются.

---

## Остановка

```bash
docker-compose -f prod-config/docker-compose.yml down
```

---