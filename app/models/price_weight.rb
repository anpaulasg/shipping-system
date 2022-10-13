class PriceWeight < ApplicationRecord
    belongs_to :delivery_mode
    validates :min_weight, :max_weight, :weight_price, :delivery_mode, presence: true 
end
