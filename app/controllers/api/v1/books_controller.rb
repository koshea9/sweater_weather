class Api::V1::BooksController < ApplicationController
  def show
    location = params[:location]
    if location.blank?
      render json: { errors: [{
        status: '400',
        detail: 'location cannot be blank'
      }] }, status: 400
    else
      books = BooksFacade.books_by_location(location, params[:quantity])
      render json: BooksSerializer.new(books)
    end
  end
end
