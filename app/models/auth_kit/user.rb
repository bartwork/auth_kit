# frozen_string_literal: true

module AuthKit
  class User < ApplicationRecord
    has_one_attached :avatar
    has_secure_password
    has_secure_token :confirmation_token, length: 36
    validates :email, presence: true
    validates :reset_password_token, :confirmation_token, :unlock_token, uniqueness: true, allow_nil: true

  end
end
