require 'rails_helper'

RSpec.describe 'Route request' do
  describe 'happy paths' do
    it 'returns start & end city, travel_time, and weather_at_eta' do
      User.create!(email: 'bonnyjowman@fake.com', password: 'password', api_key: 'asdkfh087fd')

      params = {
        "origin": "new york,ny",
        "destination": "richmond,va",
        "api_key": "asdkfh087fd"
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(201)
      params = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(params[:id]).to eq(nil)
      expect(params[:type]).to eq('roadtrip')

      expect(params[:attributes][:start_city]).to eq('New York,NY')
      expect(params[:attributes][:end_city]).to eq('Richmond,VA')
      expect(params[:attributes][:travel_time]).to be_an(String)

      expect(params[:attributes][:weather_at_eta][:temperature]).to be_an(Float)
      expect(params[:attributes][:weather_at_eta][:conditions]).to be_an(String)
    end
  end

  describe 'sad paths' do
    it "returns error if api_key is invalid" do
      User.create!(email: 'bonnyjowman@fake.com', password: 'password', api_key: 'asdkfh087fd')

      params = {
        "origin": "new york,ny",
        "destination": "richmond,va",
        "api_key": "kjfahdsa"
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(401)
      error = JSON.parse(response.body, symbolize_names: true)[:errors].first
    
      expect(error[:message]).to eq('invalid api key')
    end
  end
end
