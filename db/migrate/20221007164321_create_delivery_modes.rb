class CreateDeliveryModes < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_modes do |t|
      t.string :name
      t.float :minimum_distance
      t.float :maximum_distance
      t.float :minimum_weight
      t.float :maximum_weight
      t.float :initial_fee

      t.timestamps
    end
  end
end
