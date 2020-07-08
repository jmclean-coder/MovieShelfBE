class User < ApplicationRecord
  has_one :shelf, dependent: :destroy
  has_secure_password

  validates :username, :password_digest, presence: true
  validates :username, uniqueness: true
end
