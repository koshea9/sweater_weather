require 'rails_helper'

RSpec.describe BackgroundService do
  describe 'class methods' do
    it "returns an image based on location provided" do
      VCR.use_cassette('Denver background') do
        response = BackgroundService.get_background_image("denver,co")

        expect(response).to be_a(Hash)
        expect(response).to have_key(:total)
        expect(response).to have_key(:total_pages)
        expect(response).to have_key(:results)
        expect(response[:results]).to be_a(Array)
        expect(response[:results].count).to eq(1)
        expect(response[:results][0]).to be_a(Hash)

        expect(response[:results][0]).to have_key(:urls)
        expect(response[:results][0][:urls]).to be_a(Hash)
        expect(response[:results][0][:urls]).to have_key(:raw)
        expect(response[:results][0][:urls][:raw]).to be_a(String)

        expect(response[:results][0]).to have_key(:user)
        expect(response[:results][0][:user]).to be_a(Hash)
        expect(response[:results][0][:user]).to have_key(:name)
        expect(response[:results][0][:user][:name]).to be_a(String)

        expect(response[:results][0]).to have_key(:links)
        expect(response[:results][0][:links]).to be_a(Hash)
        expect(response[:results][0][:links]).to have_key(:html)
        expect(response[:results][0][:links][:html]).to be_a(String)
      end
    end
  end
end
