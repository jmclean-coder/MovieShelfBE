class MovieShelf < ApplicationRecord
  belongs_to :shelf
  belongs_to :movie
  validates :movie_id, uniqueness: true
end
