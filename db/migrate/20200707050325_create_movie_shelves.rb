class CreateMovieShelves < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_shelves do |t|
      t.belongs_to :shelf, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
