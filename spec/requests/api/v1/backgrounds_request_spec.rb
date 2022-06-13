require 'rails_helper'

RSpec.describe 'Image request' do
  it 'sends image for a given area', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    image = JSON.parse(response.body, symbolize_names: true)[:data]
  
    expect(image[:id]).to eq(nil)
    expect(image[:type]).to eq('image')
    expect(image[:attributes]).to be_a(Hash)
    expect(image[:attributes][:image]).to be_a(Hash)

    expect(image[:attributes][:image][:image_url]).to be_a(String)
    expect(image[:attributes][:image][:credit]).to be_a(Hash)
    expect(image[:attributes][:image][:credit][:source]).to be_a(String)
  end
end
