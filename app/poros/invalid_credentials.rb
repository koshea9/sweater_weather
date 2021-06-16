class InvalidCredentials < StandardError
  def http_status
    401
  end

  def code
    "unauthorized"
  end

  def detail
    "Invalid credentials, please try again"
  end
end
