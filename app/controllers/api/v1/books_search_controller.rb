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
  end
end
