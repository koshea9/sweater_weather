class Api::V1::ForecastsController < ApplicationController
  def show
    location = params[:location]
    if params[:location].blank?
      raise LocationMissing
    else
      forecast = ForecastsFacade.location_forecast(location)
      render json: ForecastSerializer.new(forecast)
    end
  end
end
