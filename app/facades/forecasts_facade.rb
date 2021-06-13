class ForecastsFacade
  def self.location_forecast(location)
    coordinates = get_coordinates(location)
    weather_data = WeatherService.get_weather_data(coordinates[:lat], coordinates[:lng])
    Forecast.new(weather_data)
  end

  def self.get_coordinates(location)
    LocationService.get_location_data(location)[:results][0][:locations][0][:latLng]
  end
end
