class RoadTripFacade

  def self.get_road_trip_data(start_city, end_city)
    travel_time = calculate_travel_time(start_city, end_city)
    weather = ForecastsFacade.get_all_location_forecast(end_city)
    RoadTrip.new(start_city, end_city, weather, travel_time)
  end

  def self.calculate_travel_time(start_city, end_city)
    data = LocationService.get_travel_time(start_city, end_city)
    if data[:info][:messages][0].blank?
      data[:route][:legs][0][:formattedTime]
    else
      "impossible route"
    end
  end
end
