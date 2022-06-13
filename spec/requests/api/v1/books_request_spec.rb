require 'rails_helper'

RSpec.describe 'Books request' do
  it 'sends book results and forecast info for a given area', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    expect(response).to be_successful
    books = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(books[:id]).to eq(nil)
    expect(books[:type]).to eq('books')
    expect(books[:attributes]).to be_a(Hash)

    expect(books[:attributes][:destination]).to be_a(String)
    expect(books[:attributes][:forecast]).to be_a(Hash)
    expect(books[:attributes][:total_books_found]).to be_a(Integer)
    expect(books[:attributes][:books]).to be_a(Array)

    expect(books[:attributes][:books].first[:isbn]).to be_a(Array)
    expect(books[:attributes][:books].first[:title]).to be_a(String)
    expect(books[:attributes][:books].first[:publisher]).to be_a(Array)
  end
end
