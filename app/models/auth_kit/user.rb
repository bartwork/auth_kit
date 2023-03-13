# frozen_string_literal: true

module AuthKit
  class User < ApplicationRecord
    has_one_attached :avatar
    has_many :refresh_session, autosave: true
    has_secure_password
    has_secure_token :confirmation_email_token, length: 36
    validates :email, presence: true, uniqueness: true
    validates :phone, uniqueness: true, allow_nil: true
    validates :reset_password_token, :confirmation_email_token, :unlock_token, uniqueness: true, allow_nil: true

    def update_sign_data(ip)
      self.update(last_sign_in_at: self.sign_in_count,
                  current_sign_in_at: DateTime.now,
                  sign_in_count: ++self.sign_in_count,
                  last_sign_in_ip: self.current_sign_in_ip,
                  current_sign_in_ip: ip)
    end

  end
end
