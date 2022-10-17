require 'rails_helper'

describe 'Usuário vê veículos' do

    it 'se estiver autenticado' do
        #Arrange

        #Act
        visit(root_path)
        within('nav') do 
            click_on('Veículos')
        end 
        #Assert
        expect(current_path).to eq new_user_session_path
    end 
    
    it 'a partir da tela menu' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        #Assert
        expect(current_path).to eq vehicles_path
    end 

    it 'com sucesso' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                             minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        vehicle = Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota Corolla', fabrication_year: '2012', maximum_capacity: '50', status: :available, delivery_mode: delivery_mode)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 

        #Assert
        expect(page).to have_content('Veículos')
        expect(page).to have_content('Toyota')
        expect(page).to have_content('Status: Disponível')
    end 

    it 'não tem veículos cadastrados' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        #Assert
        expect(page).to have_content('Não existem veículos cadastrados.')
    end 
end 