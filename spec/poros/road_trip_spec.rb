require 'rails_helper'

RSpec.describe RoadTrip do
  it 'creates a poro for a road trip with readable attributes', :vcr do
    start_city = 'denver,co'
    end_city = 'denver,co'
    road_trip = RoadTripFacade.get_road_trip_data(start_city, end_city)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.start_city).to be_a(String)
    expect(road_trip.end_city).to be_a(String)
    expect(road_trip.travel_time).to be_a(String)
    expect(road_trip.weather_at_eta).to be_a(Hash)
    expect(road_trip.weather_at_eta).to have_key(:temperature)
    expect(road_trip.weather_at_eta[:temperature]).to be_a(Float)
    expect(road_trip.weather_at_eta).to have_key(:conditions)
    expect(road_trip.weather_at_eta[:conditions]).to be_a(String)
  end
end
