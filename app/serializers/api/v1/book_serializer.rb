class BookSerializer
  class << self
    def books(books, location, forecast)
      {
        data: {
          id: nil,
          type: 'books',
          attributes: {
            destination: location,
            forecast: {
              summary: forecast.current[:conditions],
              temperature: forecast.current[:temp]
            },
            total_books_found: books.total_books_found,
            books:
            books.books_info.map do |book|
              {
                isbn: book[:isbn],
                title: book[:title],
                publisher: book[:publisher]
              }
            end
          }
        }
      }
    end
  end
end
