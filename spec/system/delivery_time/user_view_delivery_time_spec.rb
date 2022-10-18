require 'rails_helper'

describe 'Usuário vê configuração de prazos' do
    
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
        click_on('Prazos de Entrega')
        #Assert
        expect(current_path).to eq delivery_times_path
    end

    it 'com sucesso' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        DeliveryTime.create!(min_distance: 0, max_distance: 10, time: 99, delivery_mode: delivery_mode)
    
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Prazos de Entrega')
        #Arrange
        expect(page).to have_content('Prazos de Entrega')
        expect(page).to have_content('Entrega Expressa')
        expect(page).to have_content('Distância Mínima')
        expect(page).to have_content('Distância Mínima')
        expect(page).to have_content('0 km')
        expect(page).to have_content('10 km')
        expect(page).to have_content('99 horas')

    end

    it 'e não tem preços configurados' do

        #Arrange 
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Prazos de Entrega')
        #Assert
        expect(page).to have_content('Não existem prazos cadastrados.')
    end
end