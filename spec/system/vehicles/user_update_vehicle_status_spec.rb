require 'rails_helper'

describe 'Usuário informa novo status do veículo' do
    
    it 'e veículo foi para manutenção' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        vehicle = Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota Corolla', fabrication_year: '2012', maximum_capacity: '50', status: :available, delivery_mode: delivery_mode)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        click_on('Toyota Corolla')
        click_on('Manutenção')
        #Assert
        expect(current_path).to eq vehicle_path(vehicle.id)
        expect(page).to have_content('Status: Em manutenção')
    end 

    it 'e veículo está em trânsito' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                             minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        vehicle = Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota Corolla', fabrication_year: '2012', maximum_capacity: '50', status: :available, delivery_mode: delivery_mode)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        click_on('Toyota Corolla')
        click_on('Trânsito')
        #Assert 
        expect(current_path).to eq vehicle_path(vehicle.id)
        expect(page).to have_content('Status: Em trânsito')
    end 
    
    it 'apenas se o usuário for admin' do
    #Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
    delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                         minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
    vehicle = Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota Corolla', fabrication_year: '2012', maximum_capacity: '50', status: :available, delivery_mode: delivery_mode)
    #Act
    login_as(user)
    visit(root_path)
    within('nav') do
        click_on('Veículos')
    end 
    click_on('Toyota Corolla')
    #Assert
    expect(current_path).to eq vehicle_path(vehicle.id)
    expect(page).not_to have_button('Em Manutenção')
    expect(page).not_to have_button('Em trânsito')
    end 

end 
