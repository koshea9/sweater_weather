class Api::V1::RoadTripController < ApplicationController
  def show
    start_city = params[:start_city]
    end_city = params[:end_city]
    user = User.find_by_api_key(params[:api_key])
    road_trip_data = RoadTripFacade.get_road_trip_data(start_city, end_city)
    if user && start_city && end_city
      render jsons: RoadTripSerializer.new(road_trip_data)
    else
      render json: error_message, status: 401
    end
  end

  private
  def error_message
    if start_city.blank?
      {
      errors: [{
      status: '400',
      detail: 'start city cannot be blank'
      }] }
    elsif end_city.blank?
      {
      errors: [{
      status: '400',
      detail: 'end city cannot be blank'
      }] }
    elsif !user
      {
      errors: [{
      status: '400',
      detail: 'Invalid credentials, please try again'
      }] }
    end
  end
end
