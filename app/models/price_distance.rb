class PriceDistance < ApplicationRecord
  belongs_to :delivery_mode
  validates :min_distance, :max_distance, :distance_price, :delivery_mode, presence: true 
    validates :min_distance, :max_distance, numericality:{greater_than_or_equal_to: 0}
    validates :distance_price, numericality: {greater_than: 0}
    validates :distance_price, uniqueness: true
end
