class DeliveryTime < ApplicationRecord
    belongs_to :delivery_mode
    has_many :orders
end
