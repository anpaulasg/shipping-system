class Order < ApplicationRecord
    has_many :delivery_modes
    has_many :order_shippings
    has_many :close_orders

    enum status: {pending: 0, initiated: 1, terminated: 3 }
    validates :delivery_code, presence: true 
    before_validation :generate_delivery_code

    private
    def generate_delivery_code
        self.delivery_code = SecureRandom.alphanumeric(15).upcase
    end 
end
