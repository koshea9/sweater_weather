class Api::V1::BackgroundsController < ApplicationController
  def show
    image_object = Background.new(image_data, location)
    render json: BackgroundsSerializer.new(image_object)
  end
end
