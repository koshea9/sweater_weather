class Api::V1::RoadTripController < ApplicationController
  def create
    start_city = params[:origin]
    end_city = params[:destination]
    user = User.find_by_api_key(params[:api_key])
    road_trip_data = RoadTripFacade.get_road_trip_data(start_city, end_city)
    if user && start_city && end_city
      render json: RoadTripSerializer.new(road_trip_data)
    else
      render json: error_message, status: 401
    end
  end

  private
  def error_message
    user = User.find_by_api_key(params[:api_key])
    if params[:origin].blank?
      {
      errors: [{
      status: '400',
      detail: 'start city cannot be blank'
      }] }
    elsif params[:destination].blank?
      {
      errors: [{
      status: '400',
      detail: 'end city cannot be blank'
      }] }
    elsif params[:api_key].blank? || !user
      raise InvalidCredentials
    end
  end
end
