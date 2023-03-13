# frozen_string_literal: true

module AuthKit
  class RegistrationsController < ApplicationController
    include Tokens

    def sign_up
      if create_user_and_refresh_token
        render json: success_message, status: :ok
      else
        render json: error_message, status: :bad_request
      end
    end

    private

    def create_user_and_refresh_token
      ActiveRecord::Base.transaction do
        user = AuthKit::User.new user_params
        user.save
        session = AuthKit::RefreshSession.new(user: user, expires_in: AuthKit::JWT::RefreshToken.new.expiration_time)
        session.expires_in = DateTime.current
        session.save
      end
    end

    def refresh_token
      new_user.refresh_session.last.refresh_token
    end

    def new_user
      AuthKit::User.find_by(email: params['registration']['email'])
    end

    def user_params
      params.require(:registration).permit(:email, :password, :password_confirmation)
    end


    # TODO refactor payload
    def success_message
      {
        message: 'auth_kit.passwords.registrations.signed_up',
        refresh_token: refresh_token,
        access_token: access_token
      }
    end

    def access_token
      AuthKit::JWT::Encode.new(
        user_id: new_user.id,
        exp: AuthKit::JWT::AccessToken.new.expiration_time,
        iat: DateTime.now.to_time.to_i
      ).segments
    end

    def error_message
      { error: new_user.errors.full_messages }
    end
  end
end
