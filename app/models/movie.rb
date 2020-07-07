class Movie < ApplicationRecord
    has_many :movie_shelves
    has_many :shelves, through: :movie_shelves
end
