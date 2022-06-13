require 'rails_helper'

RSpec.describe 'Image Service' do
  it 'gets image url for given location', :vcr do
    response = ImageService.get_image('Denver')
    
    expect(response).to be_a Hash
    expect(response[:results].first[:urls][:raw]).to be_a(String)
  end
end
