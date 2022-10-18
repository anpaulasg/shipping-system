require 'rails_helper'

describe 'Usuário cadastra prazos de entrega' do 

    it 'a partir da tela inicial' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Prazos de Entrega')
        click_on('Cadastrar Prazos')

        #Assert
        expect(page).to have_field('Distância Mínima') 
        expect(page).to have_field('Distância Máxima')
        expect(page).to have_field('Prazo')
        expect(page).to have_field('Modalidade de Transporte')
    end 

    it 'com sucesso' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Prazos de Entrega')
        click_on('Cadastrar Prazos')
        fill_in('Distância Mínima', with: 0)
        fill_in('Distância Máxima', with: 10)
        fill_in('Prazo', with: 24)
        select('Entrega Expressa', from: 'Modalidade de Transporte')
        click_on('Enviar')
        #Assert
        expect(page).to have_content('Prazo cadastrado com sucesso')
        expect(page).to have_content('Entrega Expressa')
        expect(page).to have_content('0 km')
        expect(page).to have_content('10 km')
        expect(page).to have_content('24 horas')
    end 

    it 'com dados incompletos' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Prazos de Entrega')
        click_on('Cadastrar Prazos')
        fill_in('Distância Mínima', with: '')
        fill_in('Distância Máxima', with: '')
        fill_in('Prazo', with: '')
        click_on('Enviar')

        #Assert
        expect(page).to have_content('Prazo não cadastrado')
        expect(page).to have_content('Distância Mínima não pode ficar em branco')
        expect(page).to have_content('Distância Máxima não pode ficar em branco')
        expect(page).to have_content('Prazo não pode ficar em branco')
    end 

    it 'só se for admin' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Prazos de Entrega')
        #Assert
        expect(page).not_to have_link('Cadastrar Prazo')
    end  
end 
    
    