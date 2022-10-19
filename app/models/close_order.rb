class CloseOrder < ApplicationRecord
  belongs_to :order
  has_many :consult_orders
  has_many :close_orders
  has_many :order_shippings
  enum delay: {on_time: 0, delayed: 1}
  enum delay_reason: {other: 0, address_unknow: 1, lost: 2, absent: 3 }

  def is_delayed?(close_order, order)
    date_time = DateTime.parse(close_order.delivery_date, '%Y%m%d')
    if (order.created_at + 3600*order.order_shippings[0].final_term) < date_time
      close_order.delayed!
    else
      close_order.on_time!
    end
  end

  def release_vehicle(close_order)
    Vehicle.where(brand:OrderShipping.where(order_id:close_order.order_id)[0].chosen_vehicle)[0].available!
  end
end
