class Api::V1::BooksController < ApplicationController
  def show
    books = BooksFacade.books_by_location(params[:location], params[:quantity])

  end
end
