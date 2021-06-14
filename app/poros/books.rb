class Books
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books,
              :id
  def initialize(location, quantity, forecast_data, book_data)
    @id = nil
    @destination = location
    @forecast = forecast_data(location)
    @total_books_found = book_data[:numFound]
    @books = book_info(book_data, quantity)
  end

  def book_info(book_data, quantity)
    book_data[:docs].first(quantity.to_i).map do |book|
      require "pry"; binding.pry
      {
        isbn: book["test"]
      }
    end
  end

  def forecast_data(location)
  end

end
