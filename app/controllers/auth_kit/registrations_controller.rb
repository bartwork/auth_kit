# frozen_string_literal: true

module AuthKit
  class RegistrationsController < ApplicationController

    def sign_up
      validate_user
    end


    private

    def validate_user
      render json: { error: errors.messages }, status: :bad_request unless new_user.valid?
    end

    def new_user
      User.new(email: user_params[:email],
               password: user_params[:password],
               password_confirmation: user_params[:password_confirmation])
    end

    def user_params
      params.require(:registration).permit(:lastname, :name, :surname, :email, :password, :password_confirmation)
    end

  end
end
