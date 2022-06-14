require 'rails_helper'

RSpec.describe 'Users request' do
  it 'creates user and returns user info' do
    user = {
        email: 'bonnyjowman@fake.com',
        password: 'password',
        password_confirmation: 'password'
      }
    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/users", headers: headers, params: JSON.generate(user)

    expect(response).to be_successful
    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(user[:type]).to eq('users')
    expect(user[:id]).to be_a(Integer)
    expect(user[:attributes]).to be_a(Hash)

    expect(user[:attributes][:email]).to be_a(String)
    expect(user[:attributes][:api_key]).to be_a(String)
  end
end
