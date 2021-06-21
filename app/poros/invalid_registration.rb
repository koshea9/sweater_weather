class InvalidRegistration < StandardError
  def http_status
    400
  end

  def code
    "bad request"
  end

  def detail
    "#{error_message(user.errors)}"
  end
end
