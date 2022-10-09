require 'rails_helper'

describe 'Usuário edita veículo' do
    
    it 'com sucesso' do
        
        #Arrange
        Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '50')
        #Act
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        click_on('Toyota')
        click_on('Editar')
        fill_in('Ano de Fabricação', with: '2010')
        fill_in('Capacidade Máxima', with: '100')
        click_on('Enviar')
        
            
        #Assert
        expect(page).to have_content('Veículo atualizado com sucesso')
        expect(page).to have_content('2010')
        expect(page).to have_content('100 kg')
    end 

    it 'e mantém os campos obrigatórios' do
        #Arrange
        Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '50')
        #Act
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        click_on('Toyota')
        click_on('Editar')
        fill_in('Ano de Fabricação', with: '')
        fill_in('Capacidade Máxima', with: '')
        click_on('Enviar')
        #Assert
        expect(page).to have_content('Não foi possível atualizar o veículo')
        expect(page).to have_content('Ano de Fabricação não pode ficar em branco')
        expect(page).to have_content('Capacidade Máxima não pode ficar em branco')
    end 
end