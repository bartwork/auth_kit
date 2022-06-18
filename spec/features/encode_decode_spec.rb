# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Encode and decode JWT', type: :feature do
  let(:payload) { { user_id: 1, exp: DateTime.now.to_i } }

  it 'payload should be the same' do
    jwt = AuthKit::JWT::Encode.new(payload).segments
    decode_payload = AuthKit::JWT::Decode.new(jwt).decode_payload
    expect(payload).to eq(decode_payload)
  end
end
