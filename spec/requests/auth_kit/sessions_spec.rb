# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:content_type) { 'application/json; charset=utf-8' }
  let(:headers) { { "ACCEPT": content_type } }
  let(:url) { 'http://localhost:3000/auth/sign_in' }
  it 'Valid user session' do
    data = { session: { email: 'bartworkmail@gmail.com' } }
    post url, params: data, headers: headers
    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:ok)
  end

  it 'Invalid user email' do
    data = { session: { email: 'bartworkmail@gmail.com', password: 'test_digest' } }
    post url, params: data, headers: headers
    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:ok)
  end

  it 'Invalid user password' do
    data = { session: { email: 'bartworkmail@gmail.com' } }
    post url, params: data, headers: headers
    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:bad_request)
  end

  it 'Invalid user password_confirmation' do
    data = { registration: { email: 'bartworkmail@gmail.com' } }
    post url, params: data, headers: headers
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(response).to have_http_status(:bad_request)
  end
end
