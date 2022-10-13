class RemoveDeliveryFromDeliveryTimes < ActiveRecord::Migration[7.0]
  def change
    remove_column :delivery_times, :delivery_
  end
end
