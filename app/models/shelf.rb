class Shelf < ApplicationRecord
  belongs_to :user
  has_many :movie_shelves, dependent: :destroy
  has_many :movies, through: :movie_shelves
end
