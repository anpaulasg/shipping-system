class CloseOrdersController < ApplicationController 

    def new
        @order = Order.find(params[:order_id])
        @close_order = CloseOrder.new 
    end

    def create
        @order = Order.find(params[:order_id])
        close_order_params = params.require(:close_order).permit(:delivery_date)
        @close_order = CloseOrder.new(close_order_params)
        @close_order.order = @order 
        @close_order.save
        redirect_to @order, notice: 'Informações de entrega adicionadas com sucesso'
    end 
end 
