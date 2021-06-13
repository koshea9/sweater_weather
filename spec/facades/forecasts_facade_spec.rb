require "rails_helper"

RSpec.describe ForecastsFacade do
  describe "class methods" do
    it '.location_forecast' do
      VCR.use_cassette('Denver weather') do
        location = "denver,co"
        forecast = ForecastsFacade.location_forecast(location)

        expect(forecast).to be_a(Forecast)
      end
    end
  end
end
