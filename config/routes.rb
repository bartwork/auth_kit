# frozen_string_literal: true

AuthKit::Engine.routes.draw do
  post 'sign_up' => 'registrations#sign_up'
  post 'sign_in' => 'sessions#sign_in'
  post 'confirm_email/:token' => 'confirmation#confirm_email'
  post 'reset_password/:token/:new_password/:confirmation_password' => 'confirmation#confirm_email'
end
