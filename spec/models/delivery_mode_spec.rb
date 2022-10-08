require 'rails_helper'

RSpec.describe DeliveryMode, type: :model do
    describe '#valid?' do
        context 'presence' do
            it 'false when name is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create(name: '', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                #Act
                result = delivery_mode.valid? 

                #Assert
                expect(result). to eq false 
            end 

            it 'false when minimum distance is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create(name: 'Entrega Expressa', minimum_distance: nil, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                #Act
                result = delivery_mode.valid? 

                #Assert
                expect(result). to eq false 
            end 

            it 'false when maximum distance is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: nil,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                #Act
                result = delivery_mode.valid? 

                #Assert
                expect(result). to eq false 
            end 

            it 'false when minimum weight is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: nil, maximum_weight: 100, initial_fee: 20)
                #Act
                result = delivery_mode.valid? 

                #Assert
                expect(result). to eq false
            end 

            it 'false when maximum weight is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: nil, initial_fee: 20)
                #Act
                result = delivery_mode.valid? 

                #Assert
                expect(result). to eq false
            end 

            it 'false when initial fee is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: nil)
                #Act
                result = delivery_mode.valid? 

                #Assert
                expect(result). to eq false
            end 

        end 
        
        context 'use_already' do 
            it 'false when name is already in use' do 
                #Arrange
                first_delivery_mode = DeliveryMode.create(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)

                second_delivery_mode = DeliveryMode.create(name: 'Entrega Expressa', minimum_distance: 7, maximum_distance: 900,
                                                             minimum_weight: 10, maximum_weight: 200, initial_fee: 50)
                #Act
                result = second_delivery_mode.valid?
                #Assert 
                expect(result).to eq false 
            end 
        end 
     
        context 'numbers' do 
            it 'false when numbers are less or equal to zero' do
                #Arrange
                delivery_mode = DeliveryMode.create(name: 'Entrega Expressa', minimum_distance: -7, maximum_distance: 900,
                                                    minimum_weight: 10, maximum_weight: 0, initial_fee: 50)
                #Act
                result = delivery_mode.valid?
                #Assert
                expect(result). to eq false
            end 
        end 
    end 
end
