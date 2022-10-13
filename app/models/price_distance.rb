class PriceDistance < ApplicationRecord
  belongs_to :delivery_mode
  validates :min_distance, :max_distance, :distance_price, :delivery_mode, presence: true 
end
