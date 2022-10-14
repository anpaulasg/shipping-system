class Order < ApplicationRecord
    enum status: {pending: 0, initiated: 1, terminated: 3 }
    validates :delivery_code, presence: true 
    before_validation :generate_delivery_code

    private
    def generate_delivery_code
        self.delivery_code = SecureRandom.alphanumeric(15).upcase
    end 
end
