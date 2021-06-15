require 'rails_helper'

RSpec.describe "user login endpoint" do
  describe "happy path" do
    it 'returns the users api_key when they login' do
      registered_user_1 = User.create!(email: "user1@test.com", password: "passwordtest", api_key: "o-Iwpwaje4D1JCGudAL75Q")
      user_login = ({
            "email": "user1@test.com",
            "password": "passwordtest"
            })
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/sessions', headers: headers, params: JSON.generate(user_login)

      login_user_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

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
      expect(registered_user_data[:data][:attributes][:api_key]).to eq("o-Iwpwaje4D1JCGudAL75Q")

      expect(registered_user_data[:data][:attributes]).to_not have_key(:password)
    end
  end
end
