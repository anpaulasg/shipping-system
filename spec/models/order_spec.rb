require 'rails_helper'

RSpec.describe Order, type: :model do
    context '#valid?' do
        
        it 'must have a code' do
            #Arrange
            order = Order.new(sender_address: 'Rua Tabajara, 100', receiver_address: 'Rua Dois de Dezembro, 13', distance: 500, 
                            product_code: 'XPTO', weight: 100, width: 123, height: 1000, receiver_name: 'Ana', status: :pending)
            #Act
            result = order.valid?
            #Assert
            expect(result).to be true
        end 
    end 
    
    context '#randomcode?' do 
        describe 'generate a random code' do
            it 'at the moment user creates new service order' do
                #Arrange
                order = Order.new(sender_address: 'Rua Tabajara, 100', receiver_address: 'Rua Dois de Dezembro, 13', distance: 500, 
                                  product_code: 'XPTO', weight: 100, width: 123, height: 1000, receiver_name: 'Ana', status: :pending)
                #Act
                order.save!
                result = order.delivery_code
                #Assert
                expect(result).not_to be_empty
                expect(result.length).to eq 15
            end 
        end
    end    
end
