require 'rails_helper'

RSpec.describe RoadTripFacade do
  describe 'class methods' do
    it '.get_road_trip_data', :vcr do
      start_city = 'denver,co'
      end_city = 'seattle,wa'
      road_trip_data = RoadTripFacade.get_road_trip_data(start_city, end_city)

      expect(road_trip_data).to be_a(RoadTrip)
    end
  end
end
