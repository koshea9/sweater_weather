class BooksService
  def self.search_books(location)
    response = conn.get("/search.json") do |req|
      req.params['q'] = location
      req.params['subject'] = "travel"
    end
    parse_json(response)
  end

  private
  def self.conn
    Faraday.new("http://openlibrary.org/")
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
