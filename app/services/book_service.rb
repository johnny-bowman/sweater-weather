class BookService < BaseService
  class << self
    def get_books(location, quantity)
      response = conn('http://openlibrary.org').get("/search.json?q=#{location}&limit=#{quantity}")

      get_json(response)
    end
  end
end
