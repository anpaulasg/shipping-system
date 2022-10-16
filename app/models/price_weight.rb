class PriceWeight < ApplicationRecord
    belongs_to :delivery_mode
    has_many :orders
    validates :min_weight, :max_weight, :weight_price, :delivery_mode, presence: true
    validates :min_weight, :max_weight, numericality:{greater_than_or_equal_to: 0}
    validates :weight_price, numericality: {greater_than: 0}
    validates :weight_price, uniqueness: true
end
