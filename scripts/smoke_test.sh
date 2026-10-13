#!/usr/bin/env bash
# Дымовой тест образа: после сборки приложение должно импортироваться и работать внутри контейнера.
set -euo pipefail

IMAGE="${1:-cicd-demo:smoke}"

echo "==> Сборка образа $IMAGE"
docker build -t "$IMAGE" .

echo "==> Запуск проверки внутри контейнера"
docker run --rm "$IMAGE" python -c "from app.main import add; assert add(2, 3) == 5; print('smoke test OK')"
