require 'rails_helper'

RSpec.describe Vehicle, type: :model do
    describe '#valid?' do
        context 'presence' do
            it 'false when license plate is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                vehicle = Vehicle.create(license_plate: '', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '50', delivery_mode: delivery_mode)
                #Act
                result = vehicle.valid? 
    
                #Assert
                expect(result). to eq false 
            end 
    
            it 'false when brand is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                vehicle = Vehicle.create(license_plate: 'KPN3333', brand: '', fabrication_year: '2012', maximum_capacity: '50', delivery_mode: delivery_mode)
                
                #Act
                result = vehicle.valid? 
    
                #Assert
                expect(result). to eq false
            end
    
            it 'false when fabrication year number is empty' do
              #Arrange
              delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
              vehicle = Vehicle.create(license_plate: 'KPN3333', brand: 'Toyota', fabrication_year: '', maximum_capacity: '50', delivery_mode: delivery_mode)
              #Act
              result = vehicle.valid? 
    
              #Assert
              expect(result). to eq false
            end
    
            it 'when maximum capacity is empty' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                     minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                vehicle = Vehicle.create(license_plate: 'KPN3333', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '', delivery_mode: delivery_mode)
                #Act
                result = vehicle.valid? 
        
                #Assert
                expect(result). to eq false
            end

        end 
    
        context 'use_already' do 
            it 'false when license plate is already in use' do 
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                     minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                first_vehicle =  Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '50', delivery_mode: delivery_mode)
        
                second_vehicle = Vehicle.create(license_plate: 'KPN3333', brand: 'Ford', fabrication_year: '2011', maximum_capacity: '40',delivery_mode: delivery_mode)
                #Act
                result = second_vehicle.valid?
                #Assert 
                expect(result).to eq false
            end
        end 
        
        context 'license plate lenght' do 
            it 'false when license plate doesnt have sufficient characthers' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                    minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                vehicle =  Vehicle.create(license_plate: 'KPN33', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '50',delivery_mode: delivery_mode)
                #Act
                result = vehicle.valid?
                #Assert
                expect(result). to eq false
            end 
        end 
        
        context 'parameters in general' do 
            it 'false when less than zero' do
                #Arrange
                delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                     minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
                vehicle =  Vehicle.create(license_plate: 'KPN33', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '0', delivery_mode: delivery_mode)
                #Act
                result = vehicle.valid?
                #Assert
                expect(result). to eq false
            end 
        end 
    end 
end

