require 'rails_helper'

describe 'Usuário vê detalhes de uma modalidade de transporte' do
    it 'e vê informações adicionais' do
        #Arrange
        DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)

        #Act
        visit(root_path)
        click_on('Entrega Expressa')

        #Assert
        expect(page).to have_content('Modalidade de Transporte: Entrega Expressa')
        expect(page).to have_content('Nome da Modalidade: Entrega Expressa')
        expect(page).to have_content('Distância: 5.0 km a 800.0 km')
        expect(page).to have_content('Peso: 2.0 kg a 100.0 kg')
        expect(page).to have_content('Taxa Fixa: R$ 20.0')
    end

    it 'e volta para a tela inicial' do
        #Arrange
        DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        #Act
        visit(root_path)
        click_on('Entrega Expressa')
        click_on('Voltar')

        #Assert
        expect(current_path).to eq(root_path)
    end 
end 