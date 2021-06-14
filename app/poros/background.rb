class Background
  attr_reader :image,
              :credit,
              :attribution,
              :id

  def initialize(data, location)
    @location = location
    @id = nil
    @image = image_info(data)
    @credit = credit_info(data)
    @attribution = attribution_info(data)
  end

  def image_info(data)
    {
      location: @location,
      image_url: data[:results][0][:urls][:raw]
    }
  end

  def credit_info(data)
    {
      source: data[:results][0][:user][:links][:html],
      author: data[:results][0][:user][:name],
    }
  end

  def attribution_info(data)
    {
      source: "https://unsplash.com/",
      utm_source: "sweater_weather_app",
      utm_referral: "referral"
    }
  end
end
