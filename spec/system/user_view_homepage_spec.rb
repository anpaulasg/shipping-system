require 'rails_helper'

describe 'Usuário visita tela inicial' do

    it 'e vê o nome do app' do 
        #Arrange

        #Act
        visit(root_path)

        #Assert
        expect(page).to have_content('Transportes & Fretes')
    end

    it 'e vê modalidades de transporte cadastrados' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        DeliveryMode.create!(name: 'Entrega Comum', minimum_distance: 1, maximum_distance: 800 , minimum_weight: 1, maximum_weight: 100, initial_fee: 10.00)
        DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 1, maximum_distance: 150 , minimum_weight: 1, maximum_weight: 100, initial_fee: 20.00)
        #Act
        login_as(user)
        visit(root_path)

        #Assert
        expect(page).to have_content('Modalidades de Transporte')
        expect(page).to have_content('Entrega Comum')
        expect(page).to have_content('Entrega Expressa')

    end

    it 'e não vê modalidades de transporte cadastrados' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        #Act
        login_as(user)
        visit(root_path)

        #Assert
        expect(page).to have_content('Não existem modalidades de transporte cadastradas')
    end 
end