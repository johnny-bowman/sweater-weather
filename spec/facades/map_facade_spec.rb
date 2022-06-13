require 'rails_helper'

RSpec.describe 'Weather facade' do
  before do
    @coordinates = MapFacade.get_coordinates('denver,co')
  end

  it 'creates an instance of Map poro', :vcr do
    expect(@coordinates).to be_a(Map)
  end
end
