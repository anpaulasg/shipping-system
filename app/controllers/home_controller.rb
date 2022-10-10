class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        @delivery_modes = DeliveryMode.all
    end 
end