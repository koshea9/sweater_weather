class LocationService
  def self.get_location_data(location)
    response = conn.get('/geocoding/v1/address') do |req|
      req.params['location'] = location
      req.params['thumbMaps'] = 'false'
      req.params['maxResults'] = 1
    end
    parse_json(response)
  end

  def self.get_travel_time(start_city, end_city)
    response = conn.get('/directions/v2/route') do |req|
      req.params['from'] = start_city
      req.params['to'] = end_city
      req.params['manMaps'] = 'false'
      req.params['narrativeType'] = 'none'
    end
    parse_json(response)
  end

  private
  def self.conn
    Faraday.new(
      url: 'http://www.mapquestapi.com',
      params: {
        key: ENV['mapquest_consumer_key']
      }
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
