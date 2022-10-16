class CreateOrderShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :order_shippings do |t|
      t.float :final_price
      t.integer :final_term
      t.references :order, null: false, foreign_key: true
      t.references :delivery_mode, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
