class Api::V1::ForecastsController < ApplicationController
  def show
    location = params[:location]
    forecast = ForecastsFacade.location_forecast(location)
    render json: ForecastSerializer.new(forecast)
  end
end
