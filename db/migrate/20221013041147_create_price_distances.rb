class CreatePriceDistances < ActiveRecord::Migration[7.0]
  def change
    create_table :price_distances do |t|
      t.integer :min_distance
      t.integer :max_distance
      t.decimal :price_distance
      t.references :delivery_mode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
