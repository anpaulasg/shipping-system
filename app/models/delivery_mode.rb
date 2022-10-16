class DeliveryMode < ApplicationRecord
    has_many :vehicles
    has_many :price_weights
    has_many :price_distances
    has_many :delivery_times
    validates :name, :minimum_distance, :maximum_distance, :minimum_weight, :maximum_weight, :initial_fee, presence: true
    validates :name, uniqueness: true 
    validates :minimum_distance, :maximum_distance, :minimum_weight, :maximum_weight, :initial_fee, numericality:{greater_than: 0}
end
