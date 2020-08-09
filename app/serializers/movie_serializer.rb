class MovieSerializer < ActiveModel::Serializer
#update when db schema changes
  attributes :id, :title, :year, :poster, :genre, :imdb_id, :ratings, :mpa_rated, :plot
  has_many :shelves
end
