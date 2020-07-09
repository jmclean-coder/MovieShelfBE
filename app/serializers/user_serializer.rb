class UserSerializer < ActiveModel::Serializer
  has_one :shelf
  attributes :username
  #update when db schema changes
end
