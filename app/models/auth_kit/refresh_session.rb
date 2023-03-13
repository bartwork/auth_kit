module AuthKit
  class RefreshSession < ApplicationRecord
    belongs_to :user
    has_secure_token :refresh_token, length: 36
    validates :user, :expires_in, presence: true
    before_create :set_expires_in

    private
    def set_expires_in
      self.expires_in = AuthKit::JWT::RefreshToken.new.expiration_time unless expires_in
    end

  end
end
