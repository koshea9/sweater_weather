class Api::V1::BooksSearchController < ApplicationController
  def show
    conn = Faraday.new("http://openlibrary.org/")

    location = "denver,co"
    response = conn.get("/search.json") do |req|
      req.params['q'] = location
      req.params['subject'] = "travel"
    end
    book_data = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
    total_books_found = book_data[:numFound]
    books = [
    { isbn: book_data[:docs].map do |book|
          book[:isbn]
        end
      ],
      title: book_data[:docs].map do |book|
        book[:title]
      end,
      publisher: [
        book_data[:docs].map do |book|
          book[:publisher]
        end
      ]}
    ]}
  end
  require "pry"; binding.pry

end
