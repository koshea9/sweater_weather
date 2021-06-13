class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(data)
    @current_weather = current(data)
    @daily_weather = daily(data)
    @hourly_weather = hourly(data)
  end

  def current(data)
    {
      datetime: data[:current][:dt],
      sunrise: data[:current][:sunrise],
      sunset: data[:current][:sunset],
      temperature: data[:current][:temp],
      feels_like: data[:current][:feels_like],
      humidity: data[:current][:humidity],
      uvi: data[:current][:uvi],
      visibility: data[:current][:visibility],
      conditions: data[:current][:weather][0][:description],
      icon: data[:current][:weather][0][:icon]
    }
  end

  def daily(data)
    data[:daily].first(5).map do |day|
      {
      date: day[:dt],
      sunrise: day[:sunrise],
      sunset: day[:sunset],
      max_temp: day[:temp][:max],
      min_temp: day[:temp][:min],
      conditions: day[:weather][0][:description],
      icon: day[:weather][0][:icon]
      }
    end
  end

  def hourly(data)
    data[:hourly].first(8).map do |hour|
      {
      time: hour[:dt],
      temperature: hour[:temp],
      conditions: hour[:weather][0][:description],
      icon: hour[:weather][0][:icon]
      }
    end
  end
end
