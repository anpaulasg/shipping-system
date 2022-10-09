require 'rails_helper'

describe 'Usuário vê lista de veículos' do
    
    it 'a partir da tela menu' do
        #Arrange
        #Act
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        #Assert
        expect(current_path).to eq vehicles_path
    end 

    it 'com sucesso' do
        #Arrange
        Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '50')

        #Act
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 

        #Assert
        expect(page).to have_content('Veículos')
        expect(page).to have_content('Toyota')
    end 

    it 'não tem fornecedores cadastrados' do 
        #Arrange
        #Act
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        #Assert
        expect(page).to have_content('Não existem veículos cadastrados.')
    end 
end 