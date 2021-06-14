require 'rails_helper'

RSpec.describe WeatherService do
  describe 'class methods' do
    it 'returns weather data given valide latitude and longitude paramters' do
      VCR.use_cassette('Denver weather') do
        lat = 39.738453
        lon = -104.984853
        response = WeatherService.get_weather_data(lat, lon)

        expect(response).to be_a(Hash)
        expect(response).to_not have_key(:minutely)
        # current_weather
        expect(response).to have_key(:current)
        expect(response[:current]).to be_a(Hash)
        # datetime
        expect(response[:current]).to have_key(:dt)
        expect(response[:current][:dt]).to be_a(Integer)
        # sunrise
        expect(response[:current]).to have_key(:sunrise)
        expect(response[:current][:sunrise]).to be_a(Integer)
        # sunset
        expect(response[:current]).to have_key(:sunset)
        expect(response[:current][:sunset]).to be_a(Integer)
        # temperature
        expect(response[:current]).to have_key(:temp)
        expect(response[:current][:temp]).to be_a(Float)
        # feels_like
        expect(response[:current]).to have_key(:feels_like)
        expect(response[:current][:feels_like]).to be_a(Float)
        # humidity
        expect(response[:current]).to have_key(:humidity)
        expect(response[:current][:humidity]).to be_a(Integer)
        # uvi
        expect(response[:current]).to have_key(:uvi)
        expect(response[:current][:uvi]).to be_a(Numeric)
        # visibility
        expect(response[:current]).to have_key(:visibility)
        expect(response[:current][:visibility]).to be_a(Integer)
        # conditions
        expect(response[:current]).to have_key(:weather)
        expect(response[:current][:weather]).to be_a(Array)
        expect(response[:current][:weather][0]).to have_key(:description)
        expect(response[:current][:weather][0][:description]).to be_a(String)
        # icon
        expect(response[:current][:weather][0]).to have_key(:icon)
        expect(response[:current][:weather][0][:icon]).to be_a(String)
        # daily_weather
        expect(response).to have_key(:daily)
        expect(response[:daily]).to be_a(Array)
        expect(response[:daily].count).to eq(8)
        # datetime
        expect(response[:daily][0]).to have_key(:dt)
        expect(response[:daily][0][:dt]).to be_a(Integer)
        # sunrise
        expect(response[:daily][0]).to have_key(:sunrise)
        expect(response[:daily][0][:sunrise]).to be_a(Integer)
        # sunset
        expect(response[:daily][0]).to have_key(:sunset)
        expect(response[:daily][0][:sunset]).to be_a(Integer)
        # max_temp
        expect(response[:daily][0]).to have_key(:temp)
        expect(response[:daily][0][:temp]).to be_a(Hash)
        expect(response[:daily][0][:temp]).to have_key(:min)
        expect(response[:daily][0][:temp][:min]).to be_a(Float)
        # min_temp
        expect(response[:daily][0][:temp]).to have_key(:max)
        expect(response[:daily][0][:temp][:max]).to be_a(Float)
        # conditions
        expect(response[:daily][0][:weather][0]).to have_key(:description)
        expect(response[:daily][0][:weather][0][:description]).to be_a(String)
        # icon
        expect(response[:daily][0][:weather][0]).to have_key(:icon)
        expect(response[:daily][0][:weather][0][:icon]).to be_a(String)
        # hourly_weather
        expect(response).to have_key(:hourly)
        expect(response[:hourly]).to be_a(Array)
        expect(response[:hourly].count).to eq(48)
        # time
        expect(response[:hourly][0]).to have_key(:dt)
        expect(response[:hourly][0][:dt]).to be_a(Integer)
        # temperature
        expect(response[:hourly][0]).to have_key(:temp)
        expect(response[:hourly][0][:temp]).to be_a(Float)
        # conditions
        expect(response[:hourly][0][:weather][0]).to have_key(:description)
        expect(response[:hourly][0][:weather][0][:description]).to be_a(String)
        # icon
        expect(response[:hourly][0][:weather][0]).to have_key(:icon)
        expect(response[:hourly][0][:weather][0][:icon]).to be_a(String)
      end
    end
  end
end
