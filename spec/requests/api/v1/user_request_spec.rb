require 'rails_helper'

RSpec.describe 'Users request' do
  describe 'happy paths' do
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

  describe 'sad paths' do
    it "returns error if passwords don't match" do
      user = {
        email: 'bonnyjowman@fake.com',
        password: 'password',
        password_confirmation: 'blingbling'
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user)

      expect(response.status).to eq(400)
      error = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(error).to eq("password confirmation doesn't match password")
    end

    it "returns error if email is empty" do
      user = {
        email: '',
        password: 'password',
        password_confirmation: 'blingbling'
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user)
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)[:error]
      expect(error).to eq("email can't be blank")
    end

    it "returns error if email is taken" do
      User.create!(email: 'bonnyjowman@fake.com', password: 'password', api_key: 'asdkfh087fd')

      user = {
        email: 'bonnyjowman@fake.com',
        password: 'password',
        password_confirmation: 'blingbling'
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user)
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)[:error]
      expect(error).to eq("that email is already taken")
    end
  end
end
