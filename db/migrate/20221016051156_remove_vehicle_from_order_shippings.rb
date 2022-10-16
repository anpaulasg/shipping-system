class RemoveVehicleFromOrderShippings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_shippings, :vehicle, null: false, foreign_key: true
  end
end
