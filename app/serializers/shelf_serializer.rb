class ShelfSerializer < ActiveModel::Serializer
  #update when db schema changes
  attributes :id, :user_id
  has_many :movies
end
