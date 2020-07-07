class User < ApplicationRecord
  has_one :shelf
  has_secure_password

  validates :username, :password_digest presence: true
  validates :username, uniqueness: true
end
