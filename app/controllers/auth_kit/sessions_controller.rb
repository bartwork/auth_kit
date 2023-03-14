# frozen_string_literal: true

module AuthKit
  class SessionsController < ApplicationController
    include ResponsePayload
    before_action :find_user, only: :sign_in

    def sign_in
      if find_user&.authenticate(user_params[:password]) && find_user.update_sign_data(request.remote_ip)
        success_message('auth_kit.passwords.registrations.signed_in.success', find_user)
      else
        error_message('auth_kit.passwords.registrations.signed_in.error')
      end
    end

    def validate
      jwt = request.headers["Authorization"]
      if jwt && check_jwt(jwt)
        render json: { message: 'valid'}, status: :ok
      else
        render json: { message: 'invalid'}, status: :bad_request
      end
    end

    private

    def user_params
      params.require(:session).permit(:email, :password)
    end

    def find_user
      AuthKit::User.find_by(email: user_params[:email])
    end

    def check_jwt(jwt)
      exp = AuthKit::JWT::Decode.new(jwt).decode_payload[:exp]
      if exp > DateTime.now.to_i && AuthKit::User.find(AuthKit::JWT::Decode.new(jwt).decode_payload[:user_id])
        true
      else
        false
      end
    end

  end
end
