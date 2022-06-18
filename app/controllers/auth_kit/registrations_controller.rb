# frozen_string_literal: true

module AuthKit
  class RegistrationsController < ApplicationController

    def sign_up
      if new_user.valid? && new_user.create
        render json: { message: I18n.t 'auth_kit.passwords.registrations.signed_up' }, status: :ok
      else
        render json: { error: new_user.errors.full_messages }, status: :bad_request
      end
    end

    private

    def new_user
      AuthKit::User.new(email: user_params[:email],
                        password: user_params[:password],
                        password_confirmation: user_params[:password_confirmation])
    end

    def user_params
      params.require(:registration).permit(:email, :password, :password_confirmation)
    end

  end
end
