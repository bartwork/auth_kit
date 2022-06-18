module AuthKit
  class RefreshSession < ApplicationRecord
    belongs_to :auth_kit_user
  end
end
