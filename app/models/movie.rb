class Movie < ApplicationRecord
    has_many :movie_shelves, dependent: :destroy
    has_many :shelves, through: :movie_shelves
    validates :imdb_id, uniqueness: true
    serialize :ratings, Array
end
