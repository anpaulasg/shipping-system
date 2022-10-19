class ConsultOrdersController < ApplicationController

    def search
        @delivery_code = params["query"]
        @order = Order.where(delivery_code: @delivery_code)[0]
    end 

end 

