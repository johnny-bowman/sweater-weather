require 'rails_helper'

RSpec.describe 'Book facade' do
  before do
    @books = BookFacade.get_books('denver,co', 5)
  end

  it 'creates an instance of Book poro', :vcr do
    expect(@books).to be_a(Book)
  end
end
