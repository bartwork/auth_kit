# AuthKit
Комплексное решение для JWT-аутентификации в RubyOnRails.

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

## Настройки
Добавить файл auth_kit.ru в config/initializers и скорректировать натройки:
```ruby
# Registration Policy (0 - email, 1 - phone, 2 - both)
AuthKit.registration_policy = 0
# Outgoing email address
AuthKit.mailer_sender = 'mail@example.com'
# Your private key Rails.application.credentials[:secret_key]
AuthKit.secret_key = 'secret'
# Algorithms for cryptographic signing HS256/HS384/HS512
AuthKit.hash_algorithm = 'HS256'
# Access token expiration time in seconds
AuthKit.access_token_expiration_time = 2.weeks
# Refresh token expiration time in seconds
AuthKit.refresh_token_expiration_time = 60.day
# Number of active tokens for the user (computer, phone, mobile app, tablet or other devices)
AuthKit.number_active_tokens = 5
# Range validation for password length
AuthKit.password_length = 6..128
# Used to send notification to the original user email when their email is changed.
AuthKit.send_phone_changed_notification = true
# Used to send notification to the original user email when their email is changed.
AuthKit.send_email_changed_notification = true
# Used to enable sending notification to user when their password is changed.
AuthKit.send_password_change_notification = true
# Number of authentication tries before locking an account
AuthKit.maximum_attempts = 20
# The time the user will be remembered without asking for credentials again.
AuthKit.remember_for = 2.weeks
```



## Зависимости
```ruby
gem 'bcrypt'
```


