require 'rails_helper'

RSpec.describe 'Image poro' do
  before do
    data = JSON.parse(File.read('spec/fixtures/image.json'), symbolize_names: true)
    @image = Image.new(data)
  end

  it 'exists with url and source attributes' do
    expect(@image).to be_a(Image)
    expect(@image.url).to eq('https://images.unsplash.com/photo-1573828562803-1d582aa6ab6a?ixid=MnwzMzczNjB8MHwxfHNlYXJjaHwxfHxwb3J0bGFuZHxlbnwwfDB8fHwxNjU1MTAxNTY4&ixlib=rb-1.2.1')
    expect(@image.source).to eq('Cristofer Maximilian')
  end
end
