class DeliveryTimesController < ApplicationController
    before_action :set_delivery_time, only: [:show, :edit, :update]
    before_action :authenticate_user!

    def index
        @delivery_times = DeliveryTime.all
        @delivery_time_names = []
        @delivery_times.each do |dt|
            if @delivery_time_names.exclude? dt.delivery_mode.name
                @delivery_time_names << dt.delivery_mode.name
            end
        end

    end 
    
    def new
        @delivery_time = DeliveryTime.new
        @delivery_modes = DeliveryMode.all 
    end 

    def edit
        @delivery_modes = DeliveryMode.all 
    end 

    def create
        @delivery_time = DeliveryTime.new(delivery_time_params)
        if @delivery_time.save
            redirect_to delivery_times_path, notice: 'Prazo cadastrado com sucesso.'
        else
            @delivery_modes = DeliveryMode.all 
            flash.now[:notice] = 'Prazo não cadastrado.'
            render 'new'
        end 
    end 

    def update
        if @delivery_time.update(delivery_time_params)
            redirect_to delivery_times_path , notice: 'Prazo atualizado com sucesso.'
        else
            @delivery_modes = DeliveryMode.all 
            flash.now[:notice] = 'Não foi possível atualizar o prazo por distância.'
            render 'edit'
        end 
    end 

    private
    
    def set_delivery_time
        @delivery_time = DeliveryTime.find(params[:id])
    end 

    def delivery_time_params 
        params.require(:delivery_time).permit(:min_distance, :max_distance, :time, 
                                         :delivery_mode_id)
    end 
end 