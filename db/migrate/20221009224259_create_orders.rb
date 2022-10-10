class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :pick_up_address
      t.string :code
      t.string :product_width
      t.string :product_height
      t.float :product_weight
      t.string :client_address
      t.string :client_name
      t.float :distance

      t.timestamps
    end
  end
end
