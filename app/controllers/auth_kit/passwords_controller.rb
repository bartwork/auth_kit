# frozen_string_literal: true

module AuthKit
  class PasswordsController < ApplicationController
    before_action :set_user


    def change_password

    end

    def reset_password
    end

    private

    def set_user
      AuthKit::User.find_by(confirmation_email_token: params[:token])
    end
  end
end
