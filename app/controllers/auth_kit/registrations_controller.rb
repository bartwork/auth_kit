# frozen_string_literal: true

module AuthKit
  class RegistrationsController < ApplicationController
    include ResponsePayload

    def sign_up
      if create_user_and_refresh_token
        success_message('auth_kit.passwords.registrations.signed_up.success', sign_up_user)
      else
        error_message('auth_kit.passwords.registrations.signed_up.error')
      end
    end

    private

    def create_user_and_refresh_token
      ActiveRecord::Base.transaction do
        user = AuthKit::User.new user_params
        user.save
        session = AuthKit::RefreshSession.new(user: user)
        session.expires_in = DateTime.current
        session.save
      end
    end

    def sign_up_user
      AuthKit::User.find_by(email: params['registration']['email'])
    end

    def user_params
      params.require(:registration).permit(:email, :password, :password_confirmation)
    end

  end
end
