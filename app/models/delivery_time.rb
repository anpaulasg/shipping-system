class DeliveryTime < ApplicationRecord
    belongs_to :delivery_mode
    has_many :orders
    validates :min_distance, :max_distance, :time, :delivery_mode_id, presence: true
end
