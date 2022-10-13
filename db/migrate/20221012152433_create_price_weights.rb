class CreatePriceWeights < ActiveRecord::Migration[7.0]
  def change
    create_table :price_weights do |t|
      t.integer :min_weight
      t.integer :max_weight
      t.decimal :weight_price

      t.timestamps
    end
  end
end
