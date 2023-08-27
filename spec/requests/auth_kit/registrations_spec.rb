# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  let(:content_type) { 'application/json; charset=utf-8' }
  let(:headers) { { "ACCEPT": content_type } }
  let(:url) { 'http://localhost:3000/auth/sign_up' }

  it 'Valid user registration' do
    data = { registration: { email: 'bartworkmail@gmail.com', password: '123456', password_confirmation: '123456' } }
    post url, params: data, headers: headers
    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:ok)
  end

  it 'Invalid user password_confirmation' do
    data = { registration: { email: 'bartworkmail@gmail.com', password: '1111111', password_confirmation: '000000' } }
    post url, params: data, headers: headers
    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:bad_request)
  end

  it 'Registration invalid email' do
    data = { registration: { email: 'bartworkmailgmail.com', password: '123456', password_confirmation: '123456' } }
    post url, params: data, headers: headers
    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:bad_request)
  end

  it 'Registration without passwords' do
    data = { registration: { email: 'bartworkmail@gmail.com' } }
    post url, params: data, headers: headers
    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:bad_request)
  end

  it 'Registration without email' do
    data = { registration: { password: '123456', password_confirmation: '123456' } }
    post url, params: data, headers: headers
    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:bad_request)
  end

end
