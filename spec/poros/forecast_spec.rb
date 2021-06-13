require "rails_helper"

RSpec.describe Forecast do
  it 'creates a poro for forecast with readable attributes' do
    VCR.use_cassette('Denver weather') do
      location = "denver,co"
      coordinates = ForecastsFacade.get_coordinates(location)
      data = WeatherService.get_weather_data(coordinates[:lat], coordinates[:lng])
      forecast = Forecast.new(data)

      expect(forecast.current_weather).to be_a(Hash)
      expect(forecast.current_weather[:datetime]).to eq(1623555409)
      expect(forecast.current_weather[:sunrise]).to eq()
      expect(forecast.current_weather[:sunset]).to eq()
      expect(forecast.current_weather[:temperature]).to eq()
      expect(forecast.current_weather[:feels_like]).to eq()
      expect(forecast.current_weather[:humidity]).to eq()
      expect(forecast.current_weather[:uvi]).to eq()
      expect(forecast.current_weather[:visibility]).to eq()
      expect(forecast.current_weather[:conditions]).to eq()
      expect(forecast.current_weather[:icon]).to eq()
      expect(forecast.current_weather[:datetime]).to eq()

      expect(forecast.daily_weather).to be_an(Array)

      expect(forecast.hourly_weather).to be_an(Array)

    end
  end
end
