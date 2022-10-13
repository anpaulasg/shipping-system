class AddDeliveryModeToDeliveryTimes < ActiveRecord::Migration[7.0]
  def change
    add_reference :delivery_times, :delivery_mode, null: false, foreign_key: true
  end
end
