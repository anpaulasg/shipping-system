class AddDistancePriceToPriceDistances < ActiveRecord::Migration[7.0]
  def change
    add_column :price_distances, :distance_price, :decimal
  end
end
