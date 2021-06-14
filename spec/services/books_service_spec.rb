require 'rails_helper'

RSpec.describe BooksService do
  describe "class methods" do
    it "returns book data when given valid location to search as query", :vcr do
      location = 'denver,co'
      response = BooksService.search_books(location)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:numFound)
      expect(response[:numFound]).to be_a(Integer)

      expect(response).to have_key(:docs)
      expect(response[:docs]).to be_a(Array)
      expect(response[:docs][0]).to be_a(Hash)
      expect(response[:docs][0]).to have_key(:title)
      expect(response[:docs][0]).to have_key(:isbn)
      expect(response[:docs][0]).to have_key(:publisher)
    end
  end
end
