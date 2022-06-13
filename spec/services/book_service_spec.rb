require 'rails_helper'

RSpec.describe 'Book Service' do
  it 'gets book results for given location', :vcr do
    response = BookService.get_books('denver,co')

    expect(response).to be_a Hash
    expect(response[:docs]).to be_a(Array)
    expect(response[:numFound]).to be_a(Integer)
    expect(response[:docs].first[:title]).to be_a(String)
    expect(response[:docs].first[:publisher]).to be_a(Array)
    expect(response[:docs].first[:isbn]).to be_a(Array)
  end
end
