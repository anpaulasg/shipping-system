class AddDeliveryModeToPriceWeights < ActiveRecord::Migration[7.0]
  def change
    add_reference :price_weights, :delivery_mode, null: false, foreign_key: true
  end
end
