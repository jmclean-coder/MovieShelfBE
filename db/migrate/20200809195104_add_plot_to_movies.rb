class AddPlotToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :plot, :string
  end
end
