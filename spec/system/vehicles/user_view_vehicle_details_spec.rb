require 'rails_helper'

describe 'Usuário vê detalhes de um veículo' do
    it 'a partir da tela inicial' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        vehicle = Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota Corolla', fabrication_year: '2012', maximum_capacity: '50', status: :available, delivery_mode: delivery_mode)

        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end
        click_on('Toyota')

        #Assert
        expect(page).to have_content('Veículo: Toyota')
        expect(page).to have_content('Placa: KPN3333')
        expect(page).to have_content('Ano de Fabricação: 2012')
        expect(page).to have_content('Capacidade Máxima: 50.0 kg')
        expect(page).to have_content('Status: Disponível')
    end 

    it 'e volta para a lista/tela inicial de veículos' do 

        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 5, maximum_distance: 800,
                                             minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        vehicle = Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota Corolla', fabrication_year: '2012', maximum_capacity: '50', status: :available, delivery_mode: delivery_mode)

        #Act
        login_as(user)
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