class CreateDeliveryTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_times do |t|
      t.integer :min_distance
      t.integer :max_distance
      t.integer :time
      t.string :delivery_

      t.timestamps
    end
  end
end
