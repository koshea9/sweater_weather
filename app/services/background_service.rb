class BackgroundService

  def self.get_background_image(location)
    response = conn.get('search/photos') do |req|
      req.params['query'] = location
      req.params['per_page'] = 1
      req.params['orientation']	= "landscape"
    end
    json_response(response)
  end

  private

  def self.conn
    conn = Faraday.new('https://api.unsplash.com') do |req|
      req.params['client_id'] = ENV['unsplash_access_key']
    end
  end

  def self.json_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
