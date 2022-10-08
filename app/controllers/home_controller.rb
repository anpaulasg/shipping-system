class HomeController < ApplicationController  
    def index
        @delivery_modes = DeliveryMode.all
    end 
end