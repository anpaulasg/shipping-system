class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :pending, :initiated, :terminated]
    before_action :authenticate_user!

    def index 
        @orders = Order.all 
    end 

    def show
    end 

    def new
        @order = Order.new
    end 

    def create 
        @order = Order.new(order_params)
        if @order.save()
            redirect_to @order, notice: 'Ordem de Serviço cadastrada com sucesso.'
        else
            flash.now[:notice] = 'Ordem de Serviço não cadastrada.'
            render 'new'
        end 
    end 

    def initiated
        @order.initiated!
        redirect_to @order
    end 

    def terminated
        @order.terminated!
        redirect_to @order
    end

    def pending
        @order.pending!
        redirect_to @order
    end 

    private

    def set_order
        @order = Order.find(params[:id])
    end 
    
    def order_params 
        params.require(:order).permit(:pick_up_address, :code, :distance, :product_width,:product_height,:product_weight, 
                                    :length,:client_address, :client_name)
    end

end