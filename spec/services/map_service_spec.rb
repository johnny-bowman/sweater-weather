require 'rails_helper'

RSpec.describe 'Map service' do
  it 'returns longitude & latitude for location', :vcr do
    response = MapService.get_coordinates('denver,co')

    expect(response).to be_a Hash
    expect(response[:results].first[:locations].first[:latLng][:lat]).to eq(39.738453)
    expect(response[:results][0][:locations].first[:latLng][:lng]).to eq(-104.984853)
  end

  it 'returns travel time between two locations', :vcr do
    response = MapService.get_route('denver,co', 'pueblo,co')

    expect(response).to be_a Hash
    expect(response[:route][:formattedTime]).to eq('01:45:23')
    expect(response[:route][:locations].first[:adminArea5]).to eq('Denver')
    expect(response[:route][:locations].first[:adminArea3]).to eq('CO')
    expect(response[:route][:locations][1][:adminArea5]).to eq('Pueblo')
    expect(response[:route][:locations][1][:adminArea3]).to eq('CO')
  end
end
