require 'rails_helper'

RSpec.describe PriceDistance, type: :model do
    describe '#valid?' do
        context 'presence' do
            it 'false when max distance is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                price_distance = PriceDistance.create(max_distance: nil, min_distance: 10, distance_price: 0.50, delivery_mode: delivery_mode)
                #Act
                result = price_distance.valid? 
    
                #Assert
                expect(result). to eq false 
            end 
    
            it 'false when min distance is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                     minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                price_distance = PriceDistance.create(max_distance: 50, min_distance: nil, distance_price: 0.50, delivery_mode: delivery_mode)
                
                #Act
                result = price_distance.valid? 
    
                #Assert
                expect(result). to eq false
            end
    
            it 'false when distance price is empty' do
              #Arrange
              delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
              price_distance = PriceDistance.create(max_distance: 50, min_distance: 10, distance_price: nil, delivery_mode: delivery_mode)
              #Act
              result = price_distance.valid?  
    
              #Assert
              expect(result). to eq false
            end
    
            it 'false when delivery_mode is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                     minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                price_distance = PriceDistance.create(max_distance: 50, min_distance: 10, distance_price: nil, delivery_mode: nil)
                #Act
                result = price_distance.valid? 
        
                #Assert
                expect(result). to eq false
            end

        end 
    
        context 'use_already' do 
            it 'false when distance_price is already in use' do 
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                first_price_distance = PriceDistance.create(max_distance: 50, min_distance: 10, distance_price: 0.5, delivery_mode: delivery_mode)
        
                second_price_distance = PriceDistance.create(max_distance: 50, min_distance: 10, distance_price: 0.5, delivery_mode: delivery_mode)
                #Act
                result = second_price_distance.valid?
                #Assert 
                expect(result).to eq false
            end
        end 
        
        
        context 'parameters in general' do 
            it 'false when less than zero' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                     minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                price_distance = PriceDistance.create(max_distance: 50, min_distance: 10, distance_price: -1, delivery_mode: delivery_mode)
                #Act
                result = price_distance.valid?
                #Assert
                expect(result). to eq false
            end 
        end 
    end 
end
