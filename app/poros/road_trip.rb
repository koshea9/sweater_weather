class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta,
              :id

  def initialize(start_city, end_city, weather, travel_time)
    @id = nil
    @start_city = start_city
    @end_city = end_city
    @travel_time = travel_time
    @weather_at_eta = calculate_weather_at_eta(weather, travel_time)
  end

  def calculate_weather_at_eta(weather, travel_time)
    if @travel_time == "impossible route"
      {
        temperature: "",
        conditions: ""
      }
    else
      {
        temperature: weather[:hourly][travel_time.to_i][:temp],
        conditions: weather[:hourly][travel_time.to_i][:weather][0][:description]
      }
    end
  end
end
