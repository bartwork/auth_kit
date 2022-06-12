# frozen_string_literal: true

# Outgoing email address
AuthKit.mailer_sender = 'bartworkmail@gmail.com'
# Your private key
AuthKit.secret_key = Rails.application.credentials[:secret_key]
# Algorithms for cryptographic signing HS256/HS384/HS512
AuthKit.hash_algorithm = 'HS256'
# Refresh token expiration time in seconds
AuthKit.refresh_token_expiration_time = 2.weeks
# Number of active tokens for the user (computer, phone, mobile app, tablet or other devices)
AuthKit.number_active_tokens = 5
# Range validation for password length
AuthKit.password_length = 6..128
# Used to send notification to the original user email when their email is changed.
AuthKit.send_email_changed_notification = true
# Used to enable sending notification to user when their password is changed.
AuthKit.send_password_change_notification = true
# Number of authentication tries before locking an account
AuthKit.maximum_attempts = 20
# The time the user will be remembered without asking for credentials again.
AuthKit.remember_for = 2.weeks
