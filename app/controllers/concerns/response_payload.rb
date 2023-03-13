module ResponsePayload
  extend ActiveSupport::Concern

  def success_message(message, user)
    render json: {
      message: message,
      refresh_token: user_refresh_token(user),
      access_token: user_access_token(user)
    }, status: :ok
  end

  def error_message(message)
    render json: { error: message }, status: :bad_request
  end

  def user_refresh_token(user)
    user.refresh_session.last.refresh_token
  end

  def user_access_token(user)
    AuthKit::JWT::Encode.new(
      user_id: user.id,
      exp: AuthKit::JWT::AccessToken.new.expiration_time,
      iat: DateTime.now.to_time.to_i
    ).segments
  end

end
