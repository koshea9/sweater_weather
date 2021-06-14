require 'rails_helper'

RSpec.describe Books do
  it 'creates a poro for book with readable attributes' do
    location = 'denver,co'
    book_read = File.read("spec/fixtures/books_search_fixture.json")
    book_data = JSON.parse(book_read, symbolize_names: true)

    quantity = '5'
    forecast_read = File.read("spec/fixtures/denver_weather_fixture.json")
    forecast_data = JSON.parse(forecast_read, symbolize_names: true)

    book = Books.new(location, quantity, forecast_data, book_data)

    expect(book.total_books_found).to be_a(Integer)
    expect(book.books).to be_a(Array)
    expect(book.books.length).to eq(5)
    expect(book.books[0]).to be_a(Hash)
    expect(book.books[0]).to have_key(:isbn)
    expect(book.books[0][:isbn]).to be_a(Array)
    expect(book.books[0]).to have_key(:title)
    expect(book.books[0][:title]).to be_a(String)
    expect(book.books[0]).to have_key(:publisher)
    expect(book.books[0][:publisher]).to be_a(Array)
  end
end
