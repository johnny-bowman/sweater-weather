class Book
  attr_reader :total_books_found, :books_info

  def initialize(data)
    @total_books_found = data[:numFound]
    @books_info = format_books_info(data[:docs])
  end

  def format_books_info(info)
    info.map do |book_info|
      {
        isbn: book_info[:isbn],
        title: book_info[:title],
        publisher: book_info[:publisher],
      }
    end
  end
end
