class AddRatingsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :ratings, :string
  end
end
