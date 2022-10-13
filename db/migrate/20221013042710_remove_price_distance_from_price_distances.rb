class RemovePriceDistanceFromPriceDistances < ActiveRecord::Migration[7.0]
  def change
    remove_column :price_distances, :price_distance
  end
end
