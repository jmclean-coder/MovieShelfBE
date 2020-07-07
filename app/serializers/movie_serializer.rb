class MovieSerializer < ActiveModel::Serializer
#update when db schema changes
  attributes :id, :title, :year, :runtime, :poster, :genre, :imdb_db
  has_many :movie_shelves
  has_many :shelves
end
