class AddVehicleToOrderShippings < ActiveRecord::Migration[7.0]
  def change
    add_column :order_shippings, :chosen_vehicle, :string
  end
end
