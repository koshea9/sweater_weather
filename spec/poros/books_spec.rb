require 'rails_helper'

RSpec.describe Books do
  it 'creates a poro for book with readable attributes' do
    json_response = File.read('spec/fixtures/books_search_fixture.json')
    stub_request(:get, '/api/v1/book-search?location=denver,co&quantity=5')
      .to_return(status: 200, body: json_response)
    location = "denver,co"
    quantity = "5"
    forecast = ForecastsFacade.location_forecast(location)
    response = JSON.parse(json_response, symbolize_names: true)
    book = Books.new(response)


    expect(book.total_books_found).to be_a(Integer)
    expect(book.books).to be_a(Hash)
  end
end
