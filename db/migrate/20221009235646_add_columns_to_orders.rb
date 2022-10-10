class AddColumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :length, :string
  end
end
