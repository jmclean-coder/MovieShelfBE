class MovieSerializer < ActiveModel::Serializer
#update when db schema changes
  attributes :id, :title, :year, :runtime, :poster, :genre, :imdb_id
  has_many :shelves
end
