class LocationService

  def self.get_location_data(location)
    response = conn.get('/geocoding/v1/address') do |req|
      req.params['location'] = location
      req.params['thumbMaps'] = 'false'
      req.params['maxResults'] = 1
    end
    parse_json(response)
  end

  private
  def self.conn
    Faraday.new(
      url:'http://www.mapquestapi.com',
      params: {
        key: ENV['mapquest_consumer_key']
      }
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
