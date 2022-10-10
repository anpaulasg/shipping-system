class RemoveLenghtFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :lenght, :string
  end
end
