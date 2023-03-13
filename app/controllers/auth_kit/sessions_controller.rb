# frozen_string_literal: true

module AuthKit
  class SessionsController < ApplicationController
    include ResponsePayload
    before_action :find_user

    def sign_in
      if find_user&.authenticate(user_params[:password]) && user.update_sign_data(request.remote_ip)
        success_message('auth_kit.passwords.registrations.signed_in.success', find_user)
      else
        error_message('auth_kit.passwords.registrations.signed_in.error')
      end
    end

    private

    def user_params
      params.require(:session).permit(:email, :password)
    end

    def find_user
      AuthKit::User.find_by(email: user_params[:email])
    end

  end
end
