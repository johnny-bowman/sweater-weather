class BookService < BaseService
  class << self
    def get_book(location)
      response = conn('http://openlibrary.org').get("/search.json?q=#{location}")

      get_json(response)
    end
  end
end
