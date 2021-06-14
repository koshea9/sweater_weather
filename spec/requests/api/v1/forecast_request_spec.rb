require 'rails_helper'

RSpec.describe "Forecast by location endpoint" do
  describe "happy path" do
    it "sends weather data based on location" do
      VCR.use_cassette("Denver weather") do

        get '/api/v1/forecast?location=denver,co',
        headers: {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json'
        }
      end
      forecast_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(forecast_data).to be_a(Hash)

      data = forecast_data[:data]
      data_keys = [:id, :type, :attributes]
      expect(data.keys).to eq(data_keys)

      expect(data[:id]).to eq(nil)
      expect(data[:type]).to eq('forecast')

      expect(data[:attributes]).to be_a(Hash)
      attribute_keys = [:current_weather, :daily_weather, :hourly_weather]
      expect(data[:attributes].keys).to eq(attribute_keys)

      current_weather = data[:attributes][:current_weather]
      expect(current_weather).to be_a(Hash)
      expect(current_weather[:datetime]).to be_a(String)
      expect(current_weather[:sunrise]).to be_a(String)
      expect(current_weather[:sunset]).to be_a(String)
      expect(current_weather[:temperature]).to be_a(Float)
      expect(current_weather[:feels_like]).to be_a(Float)
      expect(current_weather[:humidity]).to be_a(Numeric)
      expect(current_weather[:uvi]).to be_a(Numeric)
      expect(current_weather[:visibility]).to be_a(Numeric)
      expect(current_weather[:conditions]).to be_a(String)
      expect(current_weather[:icon]).to be_a(String)

      daily_weather = data[:attributes][:daily_weather]
      expect(daily_weather).to be_an(Array)
      expect(daily_weather.count).to eq(5)
      expect(daily_weather[1][:date]).to be_a(String)
      expect(daily_weather[1][:sunrise]).to be_a(String)
      expect(daily_weather[1][:sunset]).to be_a(String)
      expect(daily_weather[1][:max_temp]).to be_a(Float)
      expect(daily_weather[1][:min_temp]).to be_a(Float)
      expect(daily_weather[1][:conditions]).to be_a(String)
      expect(daily_weather[1][:icon]).to be_a(String)

      hourly_weather = data[:attributes][:hourly_weather]
      expect(hourly_weather).to be_an(Array)
      expect(hourly_weather.count).to eq(8)
      expect(hourly_weather[4][:time]).to be_a(String)
      expect(hourly_weather[4][:temperature]).to be_a(Float)
      expect(hourly_weather[4][:conditions]).to be_a(String)
      expect(hourly_weather[4][:icon]).to be_a(String)
    end
  end

describe "sad path" do
  it "should handle errors when no location is provided" do
    VCR.use_cassette("no forecast data response") do

      get '/api/v1/forecast?location=',
      headers: {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
      end
      forecast_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(forecast_data).to be_a(Hash)
      expect(forecast_data).to have_key :errors
    end
  end
end
