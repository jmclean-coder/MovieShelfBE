class MovieShelfSerializer < ActiveModel::Serializer
  attributes :id, :movie_id, :shelf_id
  belongs_to :shelf
  belongs_to :movie
end
