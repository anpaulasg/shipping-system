require 'rails_helper'

describe 'Usuário vê detalhes de um veículo' do
    it 'a partir da tela inicial' do
        #Arrange
        Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '50')

        #Act
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end
        click_on('Toyota')

        #Assert
        expect(page).to have_content('Veículo: Toyota')
        expect(page).to have_content('Placa: KPN3333')
        expect(page).to have_content('Ano de Fabricação: 2012')
        expect(page).to have_content('Capacidade Máxima: 50 kg')
    end 

    it 'e volta para a lista/tela inicial de veículos' do 

        #Arrange
        Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota', fabrication_year: '2012', maximum_capacity: '50')
        #Act
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end
        click_on('Toyota')
        click_on('Voltar')
        #Assert
        expect(current_path).to eq vehicles_path
    end 
end 