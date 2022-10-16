class OrderShippingsController < ApplicationController 
    
    def show
        @order = Order.find(params[:order_id])
        @order_delete = OrderShipping.last().delete()
    end 

    def new
        @order = Order.find(params[:order_id])
        @order_shipping = OrderShipping.new
        @delivery_modes = DeliveryMode.all
        @price_weights = PriceWeight.all
        @price_distances = PriceDistance.all
        @delivery_times = DeliveryTime.all
    end 


    def create
        @order = Order.find(params[:order_id])
        order_shipping_params = params.require(:order_shipping).permit(:delivery_mode_id, :final_term, :final_price)
        @order_shipping = OrderShipping.new(order_shipping_params)
        @order_shipping.order = @order 
        @order_shipping.save
        redirect_to @order, notice: 'Informações adicionadas com sucesso'
    end  
end 
