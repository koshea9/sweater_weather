class Api::V1::ForecastsController < ApplicationController
  def show
    location = params[:location]
    forecast = ForecastsFacade.location_forecast(location)
  end
end
