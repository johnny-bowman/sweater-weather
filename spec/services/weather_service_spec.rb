require 'rails_helper'

RSpec.describe 'Weather Service' do
  it 'gets weather data for given coordinates', :vcr do
    response = WeatherService.get_weather(39.738453,-104.984853)

    expect(response).to be_a Hash
    expect(response).to have_key(:current)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:daily)
    
    expect(response).not_to have_key(:alerts)
    expect(response).not_to have_key(:minutely)
  end
end
