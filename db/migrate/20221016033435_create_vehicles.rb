class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.string :brand
      t.string :fabrication_year
      t.float :maximum_capacity
      t.references :delivery_mode, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
