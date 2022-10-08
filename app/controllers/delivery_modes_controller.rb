class DeliveryModesController < ApplicationController 
    before_action :set_delivery_mode, only: [:show, :edit, :update]
    
    def new 
        @delivery_mode = DeliveryMode.new
    end 

    def create
        @delivery_mode = DeliveryMode.new(delivery_mode_params)
        if @delivery_mode.save()
            redirect_to root_path, notice: 'Modalidade de Transporte cadastrada com sucesso.'
        else
            flash.now[:notice] = 'Modalidade de Transporte não cadastrada.'
            render 'new'
        end 
    end 

    def edit
    end 

    def update
        if @delivery_mode.update(delivery_mode_params)
            redirect_to @delivery_mode, notice: 'Modalidade de Transporte atualizada com sucesso.'
        else
            flash.now[:notice] = 'Não foi possível atualizar a modalidade de transporte.'
            render 'edit'
        end 
    end 

    private

    def set_delivery_mode
        @delivery_mode = DeliveryMode.find(params[:id])
    end 

    def delivery_mode_params 
        params.require(:delivery_mode).permit(:name, :minimum_distance, :maximum_distance, 
                                         :minimum_weight, :maximum_weight, :initial_fee)
    end
end 