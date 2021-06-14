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
    @books = book_data(book_data, quantity)
    require "pry"; binding.pry
  end

  def book_data(book_data, quantity)
    # book_data[:docs].first(quantity.to_i) do |book|
    #   { isbn: book_data[:docs].map do |book|
    #         book[:isbn]
    #       end,
    #     title: book_data[:docs].map do |book|
    #       book[:title]
    #     end,
    #     publisher:
    #       book_data[:docs].map do |book|
    #         book[:publisher]
    #       end
    #     }]
    # end
  end

  def forecast_data(location)
  end

end
