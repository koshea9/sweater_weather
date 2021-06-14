class Api::V1::BackgroundsController < ApplicationController
  def show
    location = params[:location]
    if params[:location].blank?
      render json: { errors: [{
        status: '400',
        detail: 'location cannot be blank'
      }] }, status: 400
    else
      image = BackgroundsFacade.get_image(location)
      render json: BackgroundsSerializer.new(image)
    end
  end
end
