require "rails_helper"

RSpec.describe Forecast do
  it 'creates a poro for forecast with readable attributes' do
    json_response = File.read('spec/fixtures/denver_weather_fixture.json')
    stub_request(:get, '/api/v1/forecast?location=denver,co').
      to_return(status: 200, body: json_response)
    response = JSON.parse(json_response, symbolize_names: true)
    forecast = Forecast.new(response)

    expect(forecast.current_weather).to be_a(Hash)
    expect(forecast.current_weather[:datetime]).to eq("2021-06-12 21:30:29 -0600")
    expect(forecast.current_weather[:sunrise]).to eq("2021-06-12 05:31:29 -0600")
    expect(forecast.current_weather[:sunset]).to eq("2021-06-12 20:28:26 -0600")
    expect(forecast.current_weather[:temperature]).to eq(75.13)
    expect(forecast.current_weather[:feels_like]).to eq(74.46)
    expect(forecast.current_weather[:humidity]).to eq(45)
    expect(forecast.current_weather[:uvi]).to eq(0)
    expect(forecast.current_weather[:visibility]).to eq(10000)
    expect(forecast.current_weather[:conditions]).to eq("clear sky")
    expect(forecast.current_weather[:icon]).to eq("01n")

    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.daily_weather[1][:date]).to be_an("2021-06-13")
    expect(forecast.daily_weather[1][:sunrise]).to be_an("2021-06-13")
    expect(forecast.daily_weather[1][:sunset]).to be_an("2021-06-13")
    expect(forecast.daily_weather[1][:max_temp]).to be_an(94.6)
    expect(forecast.daily_weather[1][:min_temp]).to be_an(67.75)
    expect(forecast.daily_weather[1][:conditions]).to be_an("clear sky")
    expect(forecast.daily_weather[1][:icon]).to be_an("01d")

    expect(forecast.hourly_weather).to be_an(Array)
    expect(forecast.hourly_weather[4][:time]).to eq("01:00:00")
    expect(forecast.hourly_weather[4][:temperature]).to eq("296.58")
    expect(forecast.hourly_weather[4][:conditions]).to eq("clear sky")
    expect(forecast.hourly_weather[4][:icon]).to eq("01n")
  end
end
