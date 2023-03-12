module AuthKit
  class RefreshSession < ApplicationRecord
    belongs_to :user
    has_secure_token :refresh_token, length: 36
    validates :user, :expires_in, presence: true
  end
end
