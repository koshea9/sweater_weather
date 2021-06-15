class User < ApplicationRecord
  before_save :generate_api_key
  validates :email, uniqueness: true, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, presence: { require: true }
  has_secure_password

  def generate_api_key
    self.api_key ||= SecureRandom.urlsafe_base64
  end
end
