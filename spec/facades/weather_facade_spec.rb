require 'rails_helper'

RSpec.describe 'Weather facade' do
  before do
    @weather = WeatherFacade.get_weather(39.738453,-104.984853)
  end

  it 'creates an instance of Weather poro', :vcr do
    expect(@weather).to be_a(Weather)
  end
end
