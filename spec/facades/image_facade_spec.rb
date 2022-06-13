require 'rails_helper'

RSpec.describe 'Image facade' do
  before do
    @image = ImageFacade.get_image('Denver')
  end

  it 'creates an instance of Image poro', :vcr do
    expect(@image).to be_a(Image)
  end
end
