require 'rails_helper'

RSpec.describe "Forecast by location endpoint" do
  before :each do
    VCR.use_cassette("Denver weather") do

      get '/api/v1/forecast?location=denver,co',
      headers: {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
    end
    @forecast_data = JSON.parse(response.body, symbolize_names: true)
  end
  describe "happy path" do
    it "sends weather data based on location" do
      expect(response).to be_successful

      data_keys = [:id, :type, :attributes]
      expect(forecast_data[:data].keys).to eq(data_keys)

      expect(forecast_data[:data]).to have_key(:id)
      expect(forecast_data[:data][:id]).to be_a(Nil)

      expect(forecast_data[:data]).to have_key(:type)
      expect(forecast_data[:data][:type]).to eq('forecast')

      expect(forecast_data[:data]).to have_key(:attributes)
      expect(forecast_data[:data][:attributes]).to be_a(Hash)

      expect(forecast_data[:data][:attributes]).to have_key(:current_weather)
      expect(forecast_data[:data][:attributes][:current_weather]).to be_a(Hash)

      expect(forecast_data[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast_data[:data][:attributes][:current_weather][:datetime]).to be_a(String)

    end
  end
end
