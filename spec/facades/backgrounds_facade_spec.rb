require 'rails_helper'

RSpec.describe BackgroundsFacade do
  describe 'class methods' do
    it '.get_image' do
      VCR.use_cassette('Denver weather') do
        location = 'denver,co'
        image = BackgroundsFacade.get_image(location)

        expect(image).to be_a(Background)
      end
    end
  end
end
