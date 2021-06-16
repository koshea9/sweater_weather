class ForecastsFacade
  def self.location_forecast(location)
    weather_data = get_all_location_forecast(location)
    Forecast.new(weather_data)
  end

  def self.get_all_location_forecast(location)
    coordinates = get_coordinates(location)
    WeatherService.get_weather_data(coordinates[:lat], coordinates[:lng])
  end

  def self.get_coordinates(location)
    LocationService.get_location_data(location)[:results][0][:locations][0][:latLng]
  end
end
