class MovieShelf < ApplicationRecord
  belongs_to :shelf
  belongs_to :movie
end
