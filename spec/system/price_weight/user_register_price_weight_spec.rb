require 'rails_helper'

describe 'Usuário cadastra preços por peso' do 
    
    it 'com sucesso' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        first_delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                                minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços por Peso')
        end 
        click_on('Cadastrar Preços por Peso')
        fill_in('Peso Mínimo', with: 0)
        fill_in('Peso Máximo', with: 10)
        fill_in('Taxa', with: 0.50)
        select('Entrega Expressa', from: 'Modalidade de Transporte')
        click_on('Enviar')
        #Assert
        expect(page).to have_content('Preço por peso cadastrado com sucesso')
        expect(page).to have_content('0 kg')
        expect(page).to have_content('10 kg')
        expect(page).to have_content('R$ 0.5')
        expect(page).to have_content('Entrega Expressa')
    end 

    it 'só se for admin' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços por Peso')
        end 
        expect(page).not_to have_link('Cadastrar Preços por Peso')
    end  
end 

