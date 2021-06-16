class Api::V1::BackgroundsController < ApplicationController
  def show
    location = params[:location]
    if params[:location].blank?
      raise LocationMissing
    else
      image = BackgroundsFacade.get_image(location)
      render json: BackgroundsSerializer.new(image)
    end
  end
end
