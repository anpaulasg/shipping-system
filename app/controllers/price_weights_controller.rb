class PriceWeightsController < ApplicationController
    before_action :set_prices_weight, only: [:show, :edit, :update]
    before_action :authenticate_user!
    
    def index
        @price_weights = PriceWeight.all
        @price_weight_names = []
        @price_weights.each do |pw|
            if @price_weight_names.exclude? pw.delivery_mode.name
                @price_weight_names << pw.delivery_mode.name
            end
        end

    end 
    
    def new
        @price_weight = PriceWeight.new
        @delivery_modes = DeliveryMode.all 
    end 

    def edit
        @delivery_modes = DeliveryMode.all
    end 

    def create
        @price_weight = PriceWeight.new(price_weight_params)
        if @price_weight.save
            redirect_to price_weights_path, notice: 'Preço por peso cadastrado com sucesso.'
        else
            @delivery_modes = DeliveryMode.all 
            flash.now[:notice] = 'Preço por peso não cadastrado.'
            render 'new'
        end 
    end 

    def update
        if @price_weight.update(price_weight_params)
            redirect_to price_weights_path , notice: 'Preço por peso atualizado com sucesso.'
        else
            @delivery_modes = DeliveryMode.all
            flash.now[:notice] = 'Não foi possível atualizar o preço por peso.'
            render 'edit'
        end 
    end 

    private
    
    def set_prices_weight
        @price_weight = PriceWeight.find(params[:id])
    end 

    def price_weight_params 
        params.require(:price_weight).permit(:min_weight, :max_weight, :weight_price, 
                                         :delivery_mode_id)
    end 
end 