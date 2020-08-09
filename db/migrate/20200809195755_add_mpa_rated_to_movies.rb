class AddMpaRatedToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :mpa_rated, :string
  end
end
