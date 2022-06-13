require 'rails_helper'

RSpec.describe 'Forecast request' do
  it 'sends forecast for a given area', :vcr do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(forecast[:id]).to eq(nil)
    expect(forecast[:type]).to eq('forecast')
    expect(forecast[:attributes]).to be_a(Hash)

    expect(forecast[:attributes]).not_to have_key(:alerts)
    expect(forecast[:attributes]).not_to have_key(:minutely)

    expect(forecast[:attributes][:current_weather][:datetime]).to be_a(String)
    expect(forecast[:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(forecast[:attributes][:current_weather][:sunset]).to be_a(String)
    expect(forecast[:attributes][:current_weather][:temperature]).to be_a(Float)
    expect(forecast[:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(forecast[:attributes][:current_weather][:humidity]).to be_an(Integer)
    expect(forecast[:attributes][:current_weather][:visibility]).to be_an(Integer)
    expect(forecast[:attributes][:current_weather][:conditions]).to be_a(String)
    expect(forecast[:attributes][:current_weather][:icon]).to be_a(String)

    expect(forecast[:attributes][:current_weather]).not_to have_key(:pressure)
    expect(forecast[:attributes][:current_weather]).not_to have_key(:dew_point)
    expect(forecast[:attributes][:current_weather]).not_to have_key(:clouds)
    expect(forecast[:attributes][:current_weather]).not_to have_key(:wind_speed)
    expect(forecast[:attributes][:current_weather]).not_to have_key(:wind_deg)

    expect(forecast[:attributes][:hourly_weather]).to be_an(Array)
    expect(forecast[:attributes][:hourly_weather].count).to eq(8)
    forecast[:attributes][:hourly_weather].each do |forecast|
      expect(forecast[:time]).to be_a(String)
      expect(forecast[:temperature]).to be_a(Float)
      expect(forecast[:conditions]).to be_a(String)
      expect(forecast[:icon]).to be_a(String)

      expect(forecast).not_to have_key(:feels_like)
      expect(forecast).not_to have_key(:humidity)
      expect(forecast).not_to have_key(:pressure)
      expect(forecast).not_to have_key(:dew_point)
      expect(forecast).not_to have_key(:uvi)
      expect(forecast).not_to have_key(:clouds)
      expect(forecast).not_to have_key(:visibility)
      expect(forecast).not_to have_key(:wind_speed)
      expect(forecast).not_to have_key(:wind_deg)
    end

    expect(forecast[:attributes][:daily_weather]).to be_an(Array)
    expect(forecast[:attributes][:daily_weather].count).to eq(5)
    forecast[:attributes][:daily_weather].each do |forecast|
      expect(forecast[:date]).to be_a(String)
      expect(forecast[:sunrise]).to be_a(String)
      expect(forecast[:sunset]).to be_a(String)
      expect(forecast[:max_temp]).to be_a(Float)
      expect(forecast[:min_temp]).to be_a(Float)
      expect(forecast[:conditions]).to be_a(String)
      expect(forecast[:icon]).to be_a(String)

      expect(forecast).not_to have_key(:moonrise)
      expect(forecast).not_to have_key(:moonset)
      expect(forecast).not_to have_key(:moon_phase)
      expect(forecast).not_to have_key(:pressure)
      expect(forecast).not_to have_key(:humidity)
      expect(forecast).not_to have_key(:dew_point)
      expect(forecast).not_to have_key(:uvi)
      expect(forecast).not_to have_key(:clouds)
      expect(forecast).not_to have_key(:visibility)
      expect(forecast).not_to have_key(:wind_speed)
      expect(forecast).not_to have_key(:wind_deg)
    end
  end
end
