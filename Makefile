IMAGE ?= cicd-demo

.PHONY: help install lint test docker-build smoke check clean

help: ## Показать список целей
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-14s %s\n", $$1, $$2}'

install: ## Установить зависимости
	pip install -r requirements.txt

lint: ## Проверить код flake8 (как на шаге lint в CI)
	flake8 app tests

test: ## Запустить тесты pytest (как на шаге test в CI)
	pytest -v

docker-build: ## Собрать Docker-образ
	docker build -t $(IMAGE) .

smoke: docker-build ## Проверить, что приложение запускается внутри образа
	./scripts/smoke_test.sh $(IMAGE)

check: lint test ## Всё, что обязательно должно пройти перед push

clean: ## Удалить кэши
	find . -type d -name __pycache__ -prune -exec rm -rf {} +
	rm -rf .pytest_cache
