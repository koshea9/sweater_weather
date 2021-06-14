require 'rails_helper'

RSpec.describe 'Background by location endpoint' do
  describe 'happy path' do
    it 'returns the url of an image corresponding to location' do
      VCR.use_cassette('Denver background') do
        get '/api/v1/backgrounds?location=denver,co',
            headers: {
              'Content-Type' => 'application/json',
              'Accept' => 'application/json'
            }
      end
      background_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(background_data).to be_a(Hash)
      keys = %i[id type attributes]
      expect(background_data.keys).to eq(keys)

      expect(background_data[:type]).to eq('image')
      expect(background_data[:id]).to eq(nil)

      expect(background_data[:attributes]).to be_a(Hash)
      attribute_keys = %i[image credit]
      attributes = background_data[:attributes]

      expect(attributes[:image]).to be_a(Hash)
      expect(attributes[:image]).to have_key(:location)
      expect(attributes[:image][:location]).to eq('denver,co')
      expect(attributes[:image]).to have_key(:image_url)
      expect(attributes[:image][:image_url]).to be_a(String)

      expect(attributes[:credit]).to be_a(Hash)
      expect(attributes[:credit]).to have_key(:source)
      expect(attributes[:credit][:source]).to be_a(String)
      expect(attributes[:credit]).to have_key(:author)
      expect(attributes[:credit][:author]).to be_a(String)
    end
  end

  describe 'sad path' do
    it 'should handle errors when no location is provided' do
      VCR.use_cassette('no background data response') do
        get '/api/v1/backgrounds?location=',
            headers: {
              'Content-Type' => 'application/json',
              'Accept' => 'application/json'
            }
      end
      forecast_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(forecast_data).to be_a(Hash)
      expect(forecast_data).to have_key(:errors)
    end
  end
end
