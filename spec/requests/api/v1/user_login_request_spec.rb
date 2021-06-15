require 'rails_helper'

RSpec.describe "user login endpoint" do
  describe "happy path" do
    it 'returns the users api_key when they login' do
      registered_user_1 = User.create!(email: "user1@test.com", password: "passwordtest", password_confirmation: "passwordtest")
      user_login = ({
            "email": "user1@test.com",
            "password": "passwordtest"
            })
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/sessions', headers: headers, params: JSON.generate(user_login)

      login_user_data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(login_user_data).to be_a(Hash)
      expect(login_user_data).to have_key(:data)
      expect(login_user_data[:data]).to be_a(Hash)

      expect(login_user_data[:data]).to have_key(:type)
      expect(login_user_data[:data][:type]).to be_a(String)

      expect(login_user_data[:data]).to have_key(:id)
      expect(login_user_data[:data][:id]).to be_a(String)

      expect(login_user_data[:data]).to have_key(:attributes)
      expect(login_user_data[:data][:attributes]).to be_a(Hash)

      expect(login_user_data[:data][:attributes]).to have_key(:email)
      expect(login_user_data[:data][:attributes][:email]).to be_a(String)

      expect(login_user_data[:data][:attributes]).to have_key(:api_key)
      expect(login_user_data[:data][:attributes][:api_key]).to eq(registered_user_1.api_key)

      expect(login_user_data[:data][:attributes]).to_not have_key(:password)
    end
  end
end
