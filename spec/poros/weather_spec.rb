require 'rails_helper'

RSpec.describe 'Weather poro' do
  before do
    data = JSON.parse(File.read('spec/fixtures/weather.json'), symbolize_names: true)
    @weather = Weather.new(data)
    expect(@weather).to be_a(Weather)
  end

  it 'exists with current weather data' do
    expect(@weather.current).to be_an(Hash)
    expect(@weather.current[:datetime]).to eq('00:30:45 UTC, 06/13/22')
    expect(@weather.current[:sunrise]).to eq('09:42:19 UTC, 06/12/22')
    expect(@weather.current[:sunset]).to eq('00:33:45 UTC, 06/13/22')
    expect(@weather.current[:temp]).to eq(77.4)
    expect(@weather.current[:feels_like]).to eq(78.46)
    expect(@weather.current[:humidity]).to eq(77)
    expect(@weather.current[:uvi]).to eq(0)
    expect(@weather.current[:visibility]).to eq(10000)
    expect(@weather.current[:conditions]).to eq('few clouds')
    expect(@weather.current[:icon]).to eq('02d')
  end

  it 'exists with hourly weather data' do
    expect(@weather.hourly).to be_an(Array)
    expect(@weather.hourly.count).to eq(8)
    expect(@weather.hourly.first[:time]).to eq('00:00:00 UTC')
    expect(@weather.hourly.first[:temp]).to eq(76.82)
    expect(@weather.hourly.first[:conditions]).to eq('few clouds')
    expect(@weather.hourly.first[:icon]).to eq('02d')
  end

  it 'exists with daily weather data' do
    expect(@weather.daily).to be_an(Array)
    expect(@weather.daily.count).to eq(5)
    expect(@weather.daily.first[:date]).to eq('2022-06-12')
    expect(@weather.daily.first[:sunrise]).to eq('Sun, 12 Jun 2022 09:42:19 UTC +00:00')
    expect(@weather.daily.first[:sunset]).to eq('Mon, 13 Jun 2022 00:33:45 UTC +00:00')
    expect(@weather.daily.first[:max_temp]).to eq(80.17)
    expect(@weather.daily.first[:min_temp]).to eq(62.46)
    expect(@weather.daily.first[:conditions]).to eq('moderate rain')
    expect(@weather.daily.first[:icon]).to eq('10d')
  end
end
