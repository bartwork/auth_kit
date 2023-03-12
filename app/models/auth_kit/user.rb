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



  end
end
