class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = User.new()
        @delivery_modes = DeliveryMode.all
    end 
end