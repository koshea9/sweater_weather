require 'rails_helper'

RSpec.describe 'Road Trip Endpoint' do
  describe 'happy path' do
    it 'displays data for the searched route' do
      road_trip_user = User.create!(email: "road_trip@test.com", password: "road_triptest", api_key: "jgn983hy48thw9begh98h4539h4")
      search_body = {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": "jgn983hy48thw9begh98h4539h4"
          }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(search_body)

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(road_trip).to be_a(Hash)
      expect(road_trip).to have_key(:data)

      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to eq(nil)

      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to be_a(String)

      expect(road_trip[:data]).to have_key(:attributes)
      expect(road_trip[:data][:attributes]).to be_a(Hash)

      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to be_a(String)
      expect(road_trip[:data][:attributes][:start_city]).to eq(search_body["origin"])

      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to be_a(String)
      expect(road_trip[:data][:attributes][:end_city]).to eq(search_body["destination"])

      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)

      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end

  describe 'sad path' do
    it 'returns a 401 is no api key provided' do
      road_trip_user = User.create!(email: "road_trip@test.com", password: "road_triptest", api_key: "jgn983hy48thw9begh98h4539h4")
      search_body = {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": ""
          }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(search_body)

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
      expect(login_user_data).to have_key(:errors)
      expect(login_user_data[:errors][0][:detail]).to be_a(String)
    end
  end

  describe 'edge cases' do
    it 'returns empty weather data and impossible trip time if route not possible' do
      road_trip_user = User.create!(email: "road_trip@test.com", password: "road_triptest", api_key: "jgn983hy48thw9begh98h4539h4")
      search_body = {
          "origin": "Denver,CO",
          "destination": "London,UK",
          "api_key": "jgn983hy48thw9begh98h4539h4"
          }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(search_body)

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(road_trip).to be_a(Hash)
      expect(road_trip).to have_key(:data)

      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to eq(nil)

      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to be_a(String)

      expect(road_trip[:data]).to have_key(:attributes)
      expect(road_trip[:data][:attributes]).to be_a(Hash)

      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to be_a(String)
      expect(road_trip[:data][:attributes][:start_city]).to eq(search_body["origin"])

      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to be_a(String)
      expect(road_trip[:data][:attributes][:end_city]).to eq(search_body["destination"])

      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to eq("impossible")

      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_empty

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_empty
    end
  end
end
