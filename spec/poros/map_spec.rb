require 'rails_helper'

RSpec.describe 'Map poro' do
  before do
    data = {
      adminArea5: 'Denver',
      latLng: {
        lat: 39.738453,
        lng: -104.984853
      }
    }
    @map = Map.new(data)
  end

  it 'exists with lat and lng attributes' do
    expect(@map).to be_a(Map)
    expect(@map.lat).to eq(39.738453)
    expect(@map.lng).to eq(-104.984853)
    expect(@map.location).to eq('Denver')
  end
end
