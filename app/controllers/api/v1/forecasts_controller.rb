class Api::V1::ForecastsController < ApplicationController
  def show
    location = params[:location]
    if params[:location].blank?
      render json: { errors: [{
        status: '400',
        detail: 'location cannot be blank'
      }] }, status: 400
    else
      forecast = ForecastsFacade.location_forecast(location)
      render json: ForecastSerializer.new(forecast)
    end
  end
end
