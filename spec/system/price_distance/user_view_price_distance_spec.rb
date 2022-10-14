require 'rails_helper'

describe 'Usuário vê configuração de preços por distância' do
    
    it 'se estiver autenticado' do
        #Arrange

        #Act
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        #Assert
        expect(current_path).to eq new_user_session_path
    end 
    
    it 'a partir do menu' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Preços por Distância')
        #Assert
        expect(current_path).to eq price_distances_path
    end

    it 'com sucesso' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        PriceDistance.create!(min_distance: 0, max_distance: 10, distance_price: 0.5, delivery_mode: delivery_mode)
    
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Preços por Distância')
        #Arrange
        expect(page).to have_content('Preços por Distância')
        expect(page).to have_content('Entrega Expressa')
        expect(page).to have_content('0 km')
        expect(page).to have_content('10 km')
        expect(page).to have_content('R$ 0.5')

    end

    it 'e não tem preços configurados' do

        #Arrange 
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Preços por Distância')
        #Assert
        expect(page).to have_content('Não existem preços cadastrados.')
    end 
end