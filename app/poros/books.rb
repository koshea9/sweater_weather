class Books
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books,
              :id
  def initialize(location, quantity, forecast_data, book_data)
    @id = nil
    @destination = location
    @forecast = forecast_info(forecast_data)
    @total_books_found = book_data[:numFound]
    @books = book_info(book_data, quantity)
  end

  def book_info(book_data, quantity)
    book_data[:docs].first(quantity.to_i).map do |book|
      {
        isbn:
          book[:isbn],
        title: book[:title],
        publisher:
          book[:publisher]
      }
    end
  end

  def forecast_info(forecast_data)
    {
      summary: forecast_data.current_weather[:conditions],
      temperature: "#{forecast_data.current_weather[:temperature]} F"
    }
  end

end
