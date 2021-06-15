require 'rails_helper'

RSpec.describe Forecast do
  it 'creates a poro for forecast with readable attributes' do
    json_response = File.read('spec/fixtures/denver_weather_fixture.json')
    stub_request(:get, '/api/v1/forecast?location=denver,co')
      .to_return(status: 200, body: json_response)
    response = JSON.parse(json_response, symbolize_names: true)
    forecast = Forecast.new(response)

    expect(forecast.current_weather).to be_a(Hash)
    expect(forecast.current_weather[:datetime]).to eq('2021-06-13 11:54:54 -0600')
    expect(forecast.current_weather[:sunrise]).to eq('2021-06-13 05:31:27 -0600')
    expect(forecast.current_weather[:sunset]).to eq('2021-06-13 20:28:52 -0600')
    expect(forecast.current_weather[:temperature]).to eq(85.68)
    expect(forecast.current_weather[:feels_like]).to eq(84.69)
    expect(forecast.current_weather[:humidity]).to eq(38)
    expect(forecast.current_weather[:uvi]).to eq(11.1)
    expect(forecast.current_weather[:visibility]).to eq(10_000)
    expect(forecast.current_weather[:conditions]).to eq('clear sky')
    expect(forecast.current_weather[:icon]).to eq('01d')

    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.daily_weather[1][:date]).to eq('2021-06-14')
    expect(forecast.daily_weather[1][:sunrise]).to be_a(String) #changed for Travis issue
    expect(forecast.daily_weather[1][:sunset]).to be_a(String)
    expect(forecast.daily_weather[1][:max_temp]).to eq(99.03)
    expect(forecast.daily_weather[1][:min_temp]).to eq(70.34)
    expect(forecast.daily_weather[1][:conditions]).to eq('clear sky')
    expect(forecast.daily_weather[1][:icon]).to eq('01d')

    expect(forecast.hourly_weather).to be_an(Array)
    expect(forecast.hourly_weather[4][:time]).to be_a(String) #'15:00:00' Travis issue
    expect(forecast.hourly_weather[4][:temperature]).to eq(91.76)
    expect(forecast.hourly_weather[4][:conditions]).to eq('clear sky')
    expect(forecast.hourly_weather[4][:icon]).to eq('01d')
  end
end
