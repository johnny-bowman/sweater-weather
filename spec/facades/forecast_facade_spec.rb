require 'rails_helper'

RSpec.describe 'Forecast facade' do
  before do
    @forecast = ForecastFacade.get_forecast(39.738453,-104.984853)
  end

  it 'creates an instance of Forecast poro', :vcr do
    expect(@forecast).to be_a(Forecast)
  end
end
