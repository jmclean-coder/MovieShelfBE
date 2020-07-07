class CreateShelves < ActiveRecord::Migration[6.0]
  def change
    create_table :shelves do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
