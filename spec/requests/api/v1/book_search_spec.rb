require 'rails_helper'

RSpec.describe "Book search endpoint" do
  describe "happy path" do
    it 'returns books based on location selected by user', :vcr do
      get '/api/v1/book-search?location=denver,co&quantity=5'

      book_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(book_data).to be_a(Hash)
      expect(book_data).to have_key(:data)
      expect(book_data[:data]).to be_a(Hash)

      expect(book_data[:data]).to have_key(:id)
      expect(book_data[:data][:id]).to be_a(String)

      expect(book_data[:data]).to have_key(:type)
      expect(book_data[:data][:type]).to be_a(String)

      expect(book_data[:data]).to have_key(:attributes)
      expect(book_data[:data][:attributes]).to be_a(Hash)

      expect(book_data[:data][:attributes]).to have_key(:destination)
      expect(book_data[:data][:attributes][:destination]).to be_a(String)

      expect(book_data[:data][:attributes]).to have_key(:forecast)
      expect(book_data[:data][:attributes][:forecast]).to be_a(Hash)
      expect(book_data[:data][:attributes][:forecast]).to have_key(:summary)
      expect(book_data[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(book_data[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(book_data[:data][:attributes][:forecast][:temperature]).to be_a(String)

      expect(book_data[:data][:attributes]).to have_key(:total_books_found)
      expect(book_data[:data][:attributes][:total_books_found]).to be_a(Integer)

      expect(book_data[:data][:attributes]).to have_key(:books)
      expect(book_data[:data][:attributes][:books]).to be_a(Array)

  end

  describe "sad path" do
    xit "returns error when no location is provided" do
    end
  end
end
