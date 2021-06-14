class Api::V1::BackgroundsController < ApplicationController
  def show
    conn = Faraday.new('https://api.unsplash.com')

    response = conn.get('search/photos') do |req|
      req.params['client_id'] = ENV['unsplash_access_key']
      req.params['query'] = "denver,co"
      req.params['per_page'] = 1
      req.params['orientation']	= "landscape"
    end
    location = "denver,co"
    image_data = JSON.parse(response.body, symbolize_names: true)

    image_object = Background.new(image_data, location)
    render json: BackgroundsSerializer.new(image_object)
  end
end
