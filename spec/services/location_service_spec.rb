require 'rails_helper'

RSpec.describe LocationService do
  it 'returns latitude and longitude data when given a valid address parameter' do
    VCR.use_cassette('Denver latitude and longitude') do
      response = LocationService.get_location_data("Denver,CO")

      expect(response).to be_a(Hash)

      expect(response).to have_key(:info)
      expect(response[:info]).to to_be(String)

      expect(response[:info]).to have_key(:statuscode)
      expect(response[:info][:statuscode]).to be_a(Integer)
      expect(response[:info][:statuscode]).to eq(0)

      expect(response).to have_key(:results)
      expect(response[:results]).to be_a(Array)

      expect(response[:results][0]).to have_key(:providedLocation)
      expect(response[:results][0][:providedLocation]).to be_a(Hash)
      expect(response[:results][0][:providedLocation][:location]).to be_a(String)

      expect(response[:results][0]).to have_key(:locations)
      expect(response[:results][0][:locations]).to be_a(Array)

      expect(response[:results][0][:location][0]).to have_key(:LatLng)
      expect(response[:results][0][:location][0][:LatLng]).to be_a(Hash)

      expect(response[:results][0][:location][0][:LatLng]).to have_key(:lat)
      expect(response[:results][0][:location][0][:LatLng][:lat]).to be_a(Float)

      expect(response[:results][0][:location][0][:LatLng]).to have_key(:lng)
      expect(response[:results][0][:location][0][:LatLng][:lng]).to be_a(Float)

      expect(response[:results][:providedLocation][:location]).to_not have_key(:mapUrl)
    end
  end
end
