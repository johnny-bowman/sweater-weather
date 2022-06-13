require 'rails_helper'

RSpec.describe 'Forecast poro' do
  before do
    data = JSON.parse(File.read('spec/fixtures/weather.json'), symbolize_names: true)
    @forecast = Forecast.new(data)
    expect(@forecast).to be_a(Forecast)
  end

  it 'exists with current forecast data' do
    expect(@forecast.current).to be_an(Hash)
    expect(@forecast.current[:datetime]).to eq('00:30:45 UTC, 06/13/22')
    expect(@forecast.current[:sunrise]).to eq('09:42:19 UTC, 06/12/22')
    expect(@forecast.current[:sunset]).to eq('00:33:45 UTC, 06/13/22')
    expect(@forecast.current[:temp]).to eq(77.4)
    expect(@forecast.current[:feels_like]).to eq(78.46)
    expect(@forecast.current[:humidity]).to eq(77)
    expect(@forecast.current[:uvi]).to eq(0)
    expect(@forecast.current[:visibility]).to eq(10000)
    expect(@forecast.current[:conditions]).to eq('few clouds')
    expect(@forecast.current[:icon]).to eq('02d')
  end

  it 'exists with hourly forecast data' do
    expect(@forecast.hourly).to be_an(Array)
    expect(@forecast.hourly.count).to eq(8)
    expect(@forecast.hourly.first[:time]).to eq('00:00:00 UTC')
    expect(@forecast.hourly.first[:temp]).to eq(76.82)
    expect(@forecast.hourly.first[:conditions]).to eq('few clouds')
    expect(@forecast.hourly.first[:icon]).to eq('02d')
  end

  it 'exists with daily forecast data' do
    expect(@forecast.daily).to be_an(Array)
    expect(@forecast.daily.count).to eq(5)
    expect(@forecast.daily.first[:date]).to eq('2022-06-12')
    expect(@forecast.daily.first[:sunrise]).to eq('Sun, 12 Jun 2022 09:42:19 UTC +00:00')
    expect(@forecast.daily.first[:sunset]).to eq('Mon, 13 Jun 2022 00:33:45 UTC +00:00')
    expect(@forecast.daily.first[:max_temp]).to eq(80.17)
    expect(@forecast.daily.first[:min_temp]).to eq(62.46)
    expect(@forecast.daily.first[:conditions]).to eq('moderate rain')
    expect(@forecast.daily.first[:icon]).to eq('10d')
  end
end
