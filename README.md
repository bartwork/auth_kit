# AuthKit
Решение для JWT-аутентификации в RubyOnRails.

## Установка
Добавить gem в Gemfile:
```ruby
gem "auth_kit", git: 'https://github.com/bartwork/auth_kit'
```
Установить gem:
```bash
bundle
```
Создать миграции с данными пользователя, при необходимости отредактировать или добавить индивидуальные поля:
```bash
rails auth_kit:install:migrations
```
Добавить маршруты в config/routes.rb:
```ruby
mount AuthKit::Engine, at: "/auth"
```

## Зависимости
```ruby
gem 'bcrypt'
```
