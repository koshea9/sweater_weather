class BooksFacade

  def self.books_by_location(location, quantity)
    book_data = BooksService.search_books(location)
    forecast_data = ForecastsFacade.location_forecast(location)
    Books.new(location, quantity, forecast_data, book_data)
  end
end
