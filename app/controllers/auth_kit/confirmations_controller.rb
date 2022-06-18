# frozen_string_literal: true

module AuthKit
  class ConfirmationsController < ApplicationController
    before_action :set_user

    def confirm_email
      if set_user&.update(confirmed_at: DateTime.now)
        render json: { message: I18n.t 'auth_kit.confirmations.success_confirm_email' }, status: :ok
      else
        render json: { error: I18n.t 'auth_kit.errors.messages.invalid_token' }, status: :bad_request
      end
    end

    private

    def set_user
      AuthKit::User.find_by(confirmation_email_token: params[:token])
    end

  end
end
