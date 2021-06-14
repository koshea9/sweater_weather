class Books
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books
  def initialize(location, quantity, forecast_data, book_data)
    @destination = location
    @forecast = forecast_data(location)
    @total_books_found = book_data[:numFound]
    @books = book_data(book_data, quantity)
  end

  def book_data(book_data, quantity)
    book_data[:docs].first(quantity.to_i) do |book|
      require "pry"; binding.pry
    end
  end

  def forecast_data(location)
  end

end
