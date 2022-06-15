require 'rails_helper'

RSpec.describe 'Route poro' do
  before do
    data = JSON.parse(File.read('spec/fixtures/route.json'), symbolize_names: true)
    @route = Route.new(data[:route])
  end

  describe 'possible route' do
    it 'exists with start_city, end_city, and travel_time attributers' do
      expect(@route).to be_a(Route)
      expect(@route.start_city).to eq('Denver,CO')
      expect(@route.end_city).to eq('Pueblo,CO')
      expect(@route.travel_time).to eq('01:45:23')
    end
  end
end
