class CreateCloseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :close_orders do |t|
      t.references :order, null: false, foreign_key: true
      t.string :delivery_date
      t.integer :delay, default: 0
      t.integer :delay_reason, default: 0
      
      t.timestamps
    end
  end
end
