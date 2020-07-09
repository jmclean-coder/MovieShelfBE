class User < ApplicationRecord
  has_one :shelf, dependent: :destroy
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
end
