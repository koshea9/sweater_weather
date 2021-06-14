require 'rails_helper'

RSpec.describe "user registration endpoint" do
  it 'creates a users and returns an api_key' do
    user_params = ({
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
          })
    headers = {"CONTENT_TYPE" => "application/json"}
    post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

    registered_user_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
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
