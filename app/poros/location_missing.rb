class LocationMissing < StandardError
  def http_status
    400
  end

  def code
    "bad request"
  end

  def detail
    "location cannot be blank"
  end
end
