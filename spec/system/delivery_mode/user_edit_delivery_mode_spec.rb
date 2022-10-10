require 'rails_helper'

describe 'Usuário edita uma modalidade de transporte' do
    
    it 'a partir da página de detalhes' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                             minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        #Act
        login_as(user)
        visit(root_path)
        click_on('Entrega Expressa')
        click_on('Editar')
        
        #Assert
        expect(page).to have_content('Editar Modalidade de Transporte')
        expect(page).to have_field('Nome da Modalidade', with: 'Entrega Expressa')
        expect(page).to have_field('Distância Mínima', with: '5.0')
        expect(page).to have_field('Distância Máxima', with: '800.0')
        expect(page).to have_field('Peso Mínimo', with: '2.0')
        expect(page).to have_field('Peso Máximo', with: '100.0')
        expect(page).to have_field('Taxa Fixa', with:'20.0')
    end 

    it 'com sucesso' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        
        #Act
        login_as(user)
        visit(root_path)
        click_on('Entrega Expressa')
        click_on('Editar')
        fill_in('Nome da Modalidade', with: 'SEDEX')
        fill_in('Taxa Fixa', with: '30')
        click_on('Enviar')
        
        #Assert
        expect(page).to have_content('Modalidade de Transporte atualizada com sucesso')
        expect(page).to have_content('Nome da Modalidade: SEDEX')
        expect(page).to have_content('Taxa Fixa: R$ 30.0')
    end 
    
    it 'e mantém os campos obrigatórios' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                             minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        
        #Act
        login_as(user)
        visit(root_path)
        click_on('Entrega Expressa')
        click_on('Editar')
        fill_in('Nome da Modalidade', with: '')
        fill_in('Taxa Fixa', with: '')
        click_on('Enviar')
        
        #Assert
        expect(page).to have_content('Não foi possível atualizar a modalidade de transporte')
    end 
end