class VehiclesController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :set_vehicle, only: [:show, :edit, :update, :repair, :transit]
    
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

    def search 
        @license_plate = params["query"]
        @vehicles = Vehicle.where("license_plate LIKE ?","%#{@license_plate}%")
    end 

    def repair
        @vehicle.repair!
        redirect_to @vehicle 
    end 

    def transit
        @vehicle.transit!
        redirect_to @vehicle
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