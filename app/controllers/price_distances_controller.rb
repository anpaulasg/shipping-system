class PriceDistancesController < ApplicationController
    before_action :set_prices_distance, only: [:show, :edit, :update]
    before_action :authenticate_user!
    
    def index
        @price_distances = PriceDistance.all
        @price_distance_names = []
        @price_distances.each do |pd|
            if @price_distance_names.exclude? pd.delivery_mode.name
                @price_distance_names << pd.delivery_mode.name
            end
        end

    end 
    
    def new
        @price_distance = PriceDistance.new
        @delivery_modes = DeliveryMode.all 
    end 

    def edit
    end 

    def create
        @price_distance = PriceDistance.new(price_distance_params)
        if @price_distance.save
            redirect_to price_distances_path, notice: 'Preço por distância cadastrado com sucesso.'
        else
            flash.now[:notice] = 'Preço por distância não cadastrado.'
            render 'new'
        end 
    end 

    def update
        if @price_distance.update(price_distance_params)
            redirect_to price_distances_path , notice: 'Preço por peso atualizado com sucesso.'
        else
            flash.now[:notice] = 'Não foi possível atualizar o preço por peso.'
            render 'edit'
        end 
    end 

    private
    
    def set_prices_distance
        @price_distance = PriceDistance.find(params[:id])
    end 

    def price_distance_params 
        params.require(:price_distance).permit(:min_distance, :max_distance, :distance_price, 
                                         :delivery_mode_id)
    end 
end 