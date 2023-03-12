# frozen_string_literal: true

require 'auth_kit/version'
require 'auth_kit/engine'
require 'auth_kit/jwt/claims_validator'
require 'auth_kit/jwt/encode'
require 'auth_kit/jwt/decode'

module AuthKit
  include JWT
  # Address which sends AuthKit e-mails.
  mattr_accessor :mailer_sender
  @@mailer_sender ||= nil

  # Secret key used by the key generator
  mattr_accessor :secret_key
  @@secret_key ||= nil

  # Algorithms for cryptographic signing HS256/HS384/HS512
  mattr_accessor :hash_algorithm
  @@hash_algorithm ||= nil

  # Refresh token expiration time in seconds
  mattr_accessor :refresh_token_expiration_time
  @@refresh_token_expiration_time ||= nil

  # Access token expiration time in seconds
  mattr_accessor :access_token_expiration_time
  @@access_token_expiration_time ||= nil

  # Number of active tokens for the user (computer, phone, mobile app, tablet or other devices)
  mattr_accessor :number_active_tokens
  @@number_active_tokens ||= 1

  # Range validation for password length
  mattr_accessor :password_length
  @@password_length ||= 6..128

  # Used to send notification to the original user email when their email is changed.
  mattr_accessor :send_email_changed_notification
  @@send_email_changed_notification ||= true

  # Used to enable sending notification to user when their password is changed.
  mattr_accessor :send_password_change_notification
  @@send_password_change_notification ||= true

  # Number of authentication tries before locking an account
  mattr_accessor :maximum_attempts
  @@maximum_attempts ||= 20

  # The time the user will be remembered without asking for credentials again.
  mattr_accessor :remember_for
  @@remember_for ||= 2.weeks
end
