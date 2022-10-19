class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :absent, :other, :address_unknown, :lost]
    before_action :authenticate_user!, only: [:index, :show] 

    def index 
        @orders = Order.all 
    end 

    def show
        @delivery_modes = DeliveryMode.all
        @close_order = CloseOrder.new
    end 

    def new
        @order = Order.new
    end 

    def create 
        @order = Order.new(order_params)
        if @order.save
            redirect_to @order, notice: 'Ordem de Serviço cadastrada com sucesso.'
        else
            flash.now[:notice] = 'Ordem de Serviço não cadastrada.'
            render 'new'
        end 
    end 

    def update
        @order = Order.new(order_params)
        if @order.save
            redirect_to @order, notice: 'Ordem de Serviço atualizada com sucesso.'
        else
            flash.now[:notice] = 'Ordem de Serviço não atualizada.'
            render 'new'
        end 
    end 

    def absent
        @close_order = CloseOrder.where(order_id:@order.id)[0]
        @close_order.absent!
        redirect_to @order 
    end

    def lost
        @close_order = CloseOrder.where(order_id:@order.id)[0]
        @close_order.lost!
        redirect_to @order 
    end 

    def other
        @close_order = CloseOrder.where(order_id:@order.id)[0]
        @close_order.other!
        redirect_to @order
    end 

    def address_unknown
        @close_order = CloseOrder.where(order_id:@order.id)[0]
        @close_order.address_unknow!
        redirect_to @order
    end 

    private

    def set_order
        @order = Order.find(params[:id])
    end 
    
    def order_params 
        params.require(:order).permit(:sender_address, :receiver_address, :distance, :product_code, :weight, :width, 
                                    :height,:receiver_name, :delivery_code)
    end
end