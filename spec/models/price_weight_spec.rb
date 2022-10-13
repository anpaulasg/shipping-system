require 'rails_helper'

RSpec.describe PriceWeight, type: :model do
    describe '#valid?' do
        context 'presence' do
            it 'false when max weight is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                     minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                price_weight = PriceWeight.create(max_weight: nil, min_weight: 10, weight_price: 0.50, delivery_mode: delivery_mode)
                #Act
                result = price_weight.valid? 
    
                #Assert
                expect(result). to eq false 
            end 
    
            it 'false when min weight is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                price_weight = PriceWeight.create(max_weight: 30, min_weight: nil, weight_price: 0.50, delivery_mode: delivery_mode)
                
                #Act
                result = price_weight.valid? 
    
                #Assert
                expect(result). to eq false
            end
    
            it 'false when weight price is empty' do
              #Arrange
              delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
              price_weight = PriceWeight.create(max_weight: 30, min_weight: 10, weight_price: nil, delivery_mode: delivery_mode)
              #Act
              result = price_weight.valid? 
    
              #Assert
              expect(result). to eq false
            end
    
            it 'false when delivery_mode is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                     minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                price_weight = PriceWeight.create(max_weight: 30, min_weight: 10, weight_price: 0.50, delivery_mode: nil)
                #Act
                result = price_weight.valid? 
        
                #Assert
                expect(result). to eq false
            end

        end 
    
        context 'use_already' do 
            it 'false when weight_price is already in use' do 
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                first_price_weight = PriceWeight.create(max_weight: 30, min_weight: 10, weight_price: 0.50, delivery_mode: delivery_mode)
        
                second_price_weight = PriceWeight.create(max_weight: 50, min_weight: 10, weight_price: 0.50, delivery_mode: delivery_mode)
                #Act
                result = second_price_weight.valid?
                #Assert 
                expect(result).to eq false
            end
        end 
        
        
        context 'parameters in general' do 
            it 'false when less than zero' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                     minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                price_weight = PriceWeight.create(max_weight: -1, min_weight: 0, weight_price: 0.50, delivery_mode: delivery_mode)
                #Act
                result = price_weight.valid?
                #Assert
                expect(result). to eq false
            end 
        end 
    end 
end