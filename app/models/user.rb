class User < ApplicationRecord
  has_one :shelf
  has_secure_password
end
