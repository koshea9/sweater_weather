require 'rails_helper'

RSpec.describe "user registration endpoint" do
  describe "happy path" do
    it 'creates a users and returns an api_key' do
      user_params = ({
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
            })
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      registered_user_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(registered_user_data).to be_a(Hash)
      expect(registered_user_data).to have_key(:data)
      expect(registered_user_data[:data]).to be_a(Hash)

      expect(registered_user_data[:data]).to have_key(:type)
      expect(registered_user_data[:data][:type]).to be_a(String)

      expect(registered_user_data[:data]).to have_key(:id)
      expect(registered_user_data[:data][:id]).to be_a(String)

      expect(registered_user_data[:data]).to have_key(:attributes)
      expect(registered_user_data[:data][:attributes]).to be_a(Hash)

      expect(registered_user_data[:data][:attributes]).to have_key(:email)
      expect(registered_user_data[:data][:attributes][:email]).to be_a(String)

      expect(registered_user_data[:data][:attributes]).to have_key(:api_key)
      expect(registered_user_data[:data][:attributes][:api_key]).to be_a(String)

      expect(registered_user_data[:data][:attributes]).to_not have_key(:password)
    end
  end
  describe "sad path" do
    it 'returns an error if passwords do not match' do
      user_params = ({
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "diffpassword"
            })
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      registered_user_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(registered_user_data).to have_key(:errors)
      expect(registered_user_data[:errors][0][:detail]).to be_a(String)
    end

    it 'returns an error if email already taken' do
      first_user_params = ({
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
            })
      first_user = User.create!(first_user_params)
      user_params = ({
            "email": "whatever@example.com",
            "password": "diffpassword",
            "password_confirmation": "diffpassword"
            })
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      registered_user_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(registered_user_data).to have_key(:errors)
      expect(registered_user_data[:errors][0][:detail]).to be_a(String)
    end

    it 'returns an error if email field' do
      user_params = ({
            "email": "",
            "password": "diffpassword",
            "password_confirmation": "diffpassword"
            })
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      registered_user_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(registered_user_data).to have_key(:errors)
      expect(registered_user_data[:errors][0][:detail]).to be_a(String)
    end

    it 'returns an error if email not valid' do
      user_params = ({
            "email": "incomplete@gmail",
            "password": "diffpassword",
            "password_confirmation": "diffpassword"
            })
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      registered_user_data = JSON.parse(response.body, symbolize_names: true)
      require "pry"; binding.pry
      expect(response.status).to eq(400)
      expect(registered_user_data).to have_key(:errors)
      expect(registered_user_data[:errors][0][:detail]).to be_a(String)
    end
  end
end
