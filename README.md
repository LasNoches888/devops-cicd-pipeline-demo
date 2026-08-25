# devops-cicd-pipeline-demo

Демонстрация CI/CD пайплайна на GitHub Actions: lint → test → build → docker push.

## Пайплайн (.github/workflows/ci.yml)
1. Установка зависимостей
2. Линт (flake8)
3. Юнит-тесты (pytest)
4. Сборка Docker-образа
5. (заглушка) публикация образа

## Локальный запуск
```bash
pip install -r requirements.txt
pytest
docker build -t cicd-demo .
```

## Активация пайплайна
Файл воркфлоу лежит в `ci/github-actions-ci.yml` (чтобы пуш не требовал scope `workflow` у токена).
Чтобы включить его как реальный GitHub Actions workflow:
```bash
mkdir -p .github/workflows
cp ci/github-actions-ci.yml .github/workflows/ci.yml
git add .github/workflows/ci.yml && git commit -m "Enable CI" && git push
```
