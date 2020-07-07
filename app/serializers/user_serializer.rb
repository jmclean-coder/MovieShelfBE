class UserSerializer < ActiveModel::Serializer
  #update when db schema changes
  attributes :id, :username, :password_digest
  has_one :shelf
end
