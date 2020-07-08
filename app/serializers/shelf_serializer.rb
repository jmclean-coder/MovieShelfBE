class ShelfSerializer < ActiveModel::Serializer
  #update when db schema changes
  attributes :id, :user_id
  belongs_to :user
  has_many :movies
end
