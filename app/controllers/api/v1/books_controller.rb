class Api::V1::BooksController < ApplicationController
  def show
    conn = Faraday.new("http://openlibrary.org/")

    location = "denver,co"
    response = conn.get("/search.json") do |req|
      req.params['q'] = location
      req.params['subject'] = "travel"
    end
    book_data = JSON.parse(response.body, symbolize_names: true)

    books = BooksFacade.books_by_location(params[:location], params[:quantity])
    
  end
end
