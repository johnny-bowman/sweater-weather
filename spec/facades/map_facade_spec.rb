require 'rails_helper'

RSpec.describe 'Map facade' do
  it 'creates an instance of Map poro', :vcr do
    @coordinates = MapFacade.get_coordinates('denver,co')
    expect(@coordinates).to be_a(Map)
  end

  it 'creates an instance of Route poro', :vcr do
    @route = MapFacade.get_route('Denver,CO', 'Pueblo,CO')
    expect(@route).to be_a(Route)
  end
end
