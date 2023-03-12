# frozen_string_literal: true

module AuthKit
  class RegistrationsController < ApplicationController
    include Tokens

    def sign_up
      if new_user.valid? && create_user_and_refresh_token
        render json: { message: "auth_kit.passwords.registrations.signed_up" }, status: :ok
      else
        render json: { error: new_user.errors.full_messages }, status: :bad_request
      end
    end

    private

    def create_user_and_refresh_token
      ActiveRecord::Base.transaction do
        new_user.save
        AuthKit::RefreshSession.create(user: new_user )
      end
    end

    def new_user
      AuthKit::User.new user_params
    end

    def user_params
      params.require(:registration).permit(:email, :password, :password_confirmation)
    end

  end
end
