# frozen_string_literal: true

module AuthKit
  class SessionsController < ApplicationController
    before_action :set_user

    def sign_in
      if set_user&.authenticate(user_params[:password]) && update_sign_data(user)
        render json: { message: 'ok'}, status: :ok
      else
        render json: { error: 'bad' }, status: :unprocessable_entity
      end
    end


    private



    def user_params
      params.require(:session).permit(:email, :password)
    end

    def set_user
      AuthKit::User.find_by(email: user_params[:email])
    end

    def update_sign_data(user)
      user.update(last_sign_in_at: user.user.sign_in_count,
                  current_sign_in_at: DateTime.now,
                  sign_in_count: ++user.sign_in_count,
                  last_sign_in_ip: user.current_sign_in_ip,
                  current_sign_in_ip: request.remote_ip)
    end


  end
end
