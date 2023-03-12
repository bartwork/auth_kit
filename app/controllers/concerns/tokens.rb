module Tokens
  extend ActiveSupport::Concern





  def create_refresh_token(user)
    AuthKit::RefreshSession.create(user_id: user.id )
  end

end