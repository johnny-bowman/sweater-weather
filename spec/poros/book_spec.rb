require 'rails_helper'

RSpec.describe 'Book poro' do
  before do
    data = JSON.parse(File.read('spec/fixtures/book.json'), symbolize_names: true)
    @books = Book.new(data)
  end

  it 'exists with total_books_found and books_info attributes' do
    expect(@books).to be_a(Book)
    expect(@books.total_books_found).to eq(42475)
    expect(@books.books_info).to be_a(Array)
    expect(@books.books_info.first[:isbn]).to eq(["9780762507849", "0762507845"])
    expect(@books.books_info.first[:title]).to eq('Denver, Co')
    expect(@books.books_info.first[:publisher]).to eq(['Universal Map Enterprises'])
  end
end
