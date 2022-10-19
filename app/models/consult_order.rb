class ConsultOrder < ApplicationRecord
  belongs_to :order
  belongs_to :order_shipping
  belongs_to :close_order
end
