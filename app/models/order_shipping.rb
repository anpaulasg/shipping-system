class OrderShipping < ApplicationRecord
  belongs_to :order
  belongs_to :delivery_mode
  has_many :consult_orders

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

  def  get_vehicle(shipping_category, delivery_mode_id, order)
    @vehicles = Vehicle.all
    @order_shippings = OrderShipping.all
    vehicles_chosen = 0
    @vehicles.each do |vehicle|
      if @order_shippings.where(order_id:order.id)[0].nil?
        if order.weight < vehicle.maximum_capacity && delivery_mode_id == vehicle.delivery_mode_id && vehicle.status == "available" && vehicles_chosen == 0
          @chosen_vehicle = vehicle.brand
          vehicle.transit!
          vehicles_chosen = 1
        end
      elsif
        if @order_shippings.where(order_id:order.id)[0].chosen_vehicle.nil? == false
          if @order_shippings.where(order_id:order.id)[0].chosen_vehicle == vehicle.brand
            @chosen_vehicle = vehicle.brand
          end
        elsif order.weight < vehicle.maximum_capacity && delivery_mode_id == vehicle.delivery_mode_id && vehicle.status == "available" && vehicles_chosen == 0
          @chosen_vehicle = vehicle.brand
          vehicle.transit!
          vehicles_chosen = 1
        end
      end
    end
    @chosen_vehicle
  end
end