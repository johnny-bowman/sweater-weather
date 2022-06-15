require 'rails_helper'

RSpec.describe 'Login request' do
  describe 'happy paths' do
    it 'returns user email & api_key' do
      User.create!(email: 'bonnyjowman@fake.com', password: 'password', api_key: 'asdkfh087fd')

      user = {
        email: 'bonnyjowman@fake.com',
        password: 'password',
        password_confirmation: 'password'
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user)

      expect(response.status).to eq(200)
      user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user[:type]).to eq('users')
      expect(user[:id]).to be_a(Integer)
      expect(user[:attributes]).to be_a(Hash)

      expect(user[:attributes][:email]).to eq('bonnyjowman@fake.com')
      expect(user[:attributes][:api_key]).to eq('asdkfh087fd')
    end
  end

  describe 'sad paths' do
    it "returns error if email doesn't exist" do
      user = {
        email: 'blingbling@fake.com',
        password: 'password',
        password_confirmation: 'password'
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user)

      expect(response.status).to eq(400)
      error = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(error).to eq("email or password is incorrect")
    end

    it "returns error if password is wrong" do
      User.create!(email: 'bonnyjowman@fake.com', password: 'password', api_key: 'asdkfh087fd')

      user = {
        email: 'bonnyjowman@fake.com',
        password: 'blingbling',
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user)

      expect(response.status).to eq(400)
      error = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(error).to eq("email or password is incorrect")
    end
  end
end
