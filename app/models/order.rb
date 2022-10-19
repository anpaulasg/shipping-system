class Order < ApplicationRecord
    has_many :delivery_modes
    has_many :order_shippings
    has_many :close_orders
    has_many :consult_orders

    enum status: {pending: 0, initiated: 1, terminated: 2 }
    validates :delivery_code, presence: true 
    before_validation :generate_delivery_code

    private
    def generate_delivery_code
        if self.delivery_code.nil?
            self.delivery_code = SecureRandom.alphanumeric(15).upcase
        end 
    end 
end
