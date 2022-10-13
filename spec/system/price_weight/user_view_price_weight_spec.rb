require 'rails_helper'

describe 'Usuário vê configuração de preços por peso' do
    
    it 'se estiver autenticado' do
        #Arrange

        #Act
        visit(root_path)
        within('nav') do
            click_on('Preços por Peso')
        end 
        #Assert
        expect(current_path).to eq new_user_session_path
    end 
    
    it 'a partir do menu' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços por Peso')
        end 
        #Assert
        expect(current_path).to eq price_weights_path
    end

    it 'com sucesso' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        PriceWeight.create!(min_weight: 0, max_weight: 10, weight_price: 0.5, delivery_mode: delivery_mode)
    
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços por Peso')
        end 
        #Arrange
        expect(page).to have_content('Preços por Peso')
        expect(page).to have_content('Entrega Expressa')
        expect(page).to have_content('0 kg')
        expect(page).to have_content('10 kg')
        expect(page).to have_content('R$ 0.5')

    end

    it 'e não tem preços configurados' do

        #Arrange 
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços por Peso')
        end 
        #Assert
        expect(page).to have_content('Não existem preços cadastrados.')
    end 
end