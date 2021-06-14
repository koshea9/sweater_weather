class BooksFacade

  def self.books_by_location(location, quantity)
    book_data = BooksService.search_books(location)
  end
# total_books_found = book_data[:numFound]
# books = [
# { isbn: book_data[:docs].map do |book|
#       book[:isbn]
#     end,
#   title: book_data[:docs].map do |book|
#     book[:title]
#   end,
#   publisher:
#     book_data[:docs].map do |book|
#       book[:publisher]
#     end
#   }]
#   require "pry"; binding.pry
end
