require 'rails_helper'

RSpec.describe 'Map service' do
  it 'returns longitude & latitude for location' do
    response = MapService.get_coordinates('denver,co')

    expect(response).to be_a Hash
    expect(response[:results].first[:locations].first[:latLng][:lat]).to eq(39.738453)
    expect(response[:results][0][:locations].first[:latLng][:lng]).to eq(-104.984853)
  end
end
