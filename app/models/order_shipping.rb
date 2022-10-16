class OrderShipping < ApplicationRecord
  belongs_to :order
  belongs_to :delivery_mode

  def price_calculator(shipping_category, initial_fee, order)
    @price_weights = PriceWeight.all
    @price_distances = PriceDistance.all
    @price_distances.each do |pd|
      if order.distance.between?(pd.min_distance, pd.max_distance) && pd.delivery_mode.name == shipping_category
          @d_price = pd.distance_price
      end
    end
    @price_weights.each do |pw|
      if order.weight.between?(pw.min_weight, pw.max_weight) && pw.delivery_mode.name == shipping_category
          @w_price = pw.weight_price
      end
    end

    order.distance*@w_price + initial_fee + @d_price

  end

  def term_calculator(shipping_category, order)
    @delivery_time = DeliveryTime.all
    @delivery_time.each do |dt|
      if order.distance.between?(dt.min_distance, dt.max_distance) && dt.delivery_mode.name == shipping_category
        @term = dt.time
      end
    end
    @term
  end

  def  get_vehicle()
    #@vehicles = Vehicle.all
  end
end

