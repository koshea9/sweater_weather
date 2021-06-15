class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, presence: { require: true }
  validates :api_key, uniqueness: true, presence: true
  has_secure_password
end
