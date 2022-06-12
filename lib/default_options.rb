# frozen_string_literal: true

module AuthKit
  module DefaultOptions
    DEFAULT_OPTIONS = {
      mailer_sender: 'mail@example.com',
      secret_key: 'secret',
      hash_algorithm: 'HS256',
      refresh_token_expiration_time: 2.weeks,
      number_active_tokens: 5,
      password_length: 6..128,
      send_email_changed_notification: true,
      send_password_change_notification: true,
      maximum_attempts: 20,
      remember_for: 2.weeks
    }.freeze
  end
end
