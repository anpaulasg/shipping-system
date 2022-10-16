class Vehicle < ApplicationRecord
  belongs_to :delivery_mode
  enum status: {available: 0, repair: 1, transit: 2}
    validates :brand, :license_plate, :fabrication_year, :maximum_capacity, presence: true 
    validates :license_plate, uniqueness: true
    validates :license_plate, length:  {is: 7 }
    validates :maximum_capacity, numericality:{greater_than: 0}
end
