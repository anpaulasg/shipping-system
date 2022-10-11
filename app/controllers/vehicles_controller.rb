class VehiclesController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :set_vehicle, only: [:show, :edit, :update]
    
    def index
        @vehicles = Vehicle.all
    end 

    def show
    end

    def new
        @vehicle = Vehicle.new
    end 

    def create
        @vehicle = Vehicle.new(vehicle_params)
        if @vehicle.save()
            redirect_to @vehicle, notice: 'Veículo cadastrado com sucesso.'
        else
            flash.now[:notice] = 'Veículo não cadastrado.'
            render 'new'
        end 
    end 

    def edit
    end 

    def update
        if @vehicle.update(vehicle_params)
            redirect_to @vehicle, notice: 'Veículo atualizado com sucesso.'
        else
            flash.now[:notice] = 'Não foi possível atualizar o veículo.'
            render 'edit'
        end 
    end 


    private

    def set_vehicle
        @vehicle = Vehicle.find(params[:id])
    end 

    def vehicle_params 
        params.require(:vehicle).permit(:license_plate, :brand, :fabrication_year, 
                                         :maximum_capacity)
    end
    
end