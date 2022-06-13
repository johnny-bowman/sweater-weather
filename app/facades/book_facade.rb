class BookFacade
  class << self
    def get_books(location, quantity)
      json = BookService.get_books(location, quantity)
      Book.new(json)
    end
  end
end
