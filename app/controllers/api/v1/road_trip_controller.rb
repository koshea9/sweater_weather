class Api::V1::RoadTripController < ApplicationController
  def create
    start_city = params[:origin]
    end_city = params[:destination]
    user = User.find_by_api_key(params[:api_key])
    if user && !start_city.blank? && !end_city.blank?
      road_trip_data = RoadTripFacade.get_road_trip_data(start_city, end_city)
      render json: RoadTripSerializer.new(road_trip_data)
    else
      error_message(start_city, end_city, user)
    end
  end

  private
  def error_message(start_city, end_city, user)
    if start_city.blank? || end_city.blank?
      raise LocationMissing
    elsif params[:api_key].blank? || !user
      raise InvalidCredentials
    end
  end
end
