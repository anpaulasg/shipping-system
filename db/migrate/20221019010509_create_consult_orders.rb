class CreateConsultOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :consult_orders do |t|
      t.references :order, null: false, foreign_key: true
      t.references :order_shipping, null: false, foreign_key: true
      t.references :close_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
