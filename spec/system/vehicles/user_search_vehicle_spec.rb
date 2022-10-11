require 'rails_helper'

describe 'Usuário procura por veículo' do

    it 'a partir do menu' do 
        #Arrange
        user = User.create!(name: 'joao', email: 'joao@sistemadefrete.com.br', password: 'password')
        #Act
        login_as(user)
        visit(root_path)
        #Assert
        within('header nav') do
            expect(page).to have_field('Buscar Veículo')
            expect(page).to have_button('Buscar')
        end 
    end
    
    it 'e deve estar autenticado' do
        #Arrange

        #Act

        visit(root_path)
        #Assert
        within('header nav') do 
            expect(page).not_to have_field('Buscar Veículo')
            expect(page).not_to have_button('Buscar')
        end 
    end 
    
    it 'e encontra veículo' do
        #Arrange
        user = User.create!(name: 'joao', email: 'joao@sistemadefrete.com.br', password: 'password')
        Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota Corolla', fabrication_year: '2012', maximum_capacity: '50', status: :available)
        Vehicle.create!(license_plate: 'KCP2489', brand: 'Ford', fabrication_year: '2009', maximum_capacity: '80')
        #Act
        login_as(user)
        visit(root_path)
        within('header nav') do 
            fill_in('Buscar Veículo', with: 'KPN3333')
            click_on('Buscar')
        end 
        #Assert
        expect(current_path).to eq search_vehicles_path
        expect(page).to have_content('Resultados da Busca por: KPN3333')
        expect(page).to have_content('1 veículo encontrado')
        expect(page).to have_content('Placa: KPN3333')
        expect(page).to have_content('Marca: Toyota Corolla')
        expect(page).to have_content('Ano de Fabricação: 2012')
        expect(page).to have_content('Status: Disponível')
        expect(page).not_to have_content('Placa: KCP2489')
        expect(page).not_to have_content('Marca: Ford')
        expect(page).not_to have_content('Ano de Fabrição: 2009')
    end 

    it 'e encontra múltiplos pedidos' do 
        #Arrange
        user = User.create!(name: 'joao', email: 'joao@sistemadefrete.com.br', password: 'password')
        Vehicle.create!(license_plate: 'KPN3333', brand: 'Toyota Corolla', fabrication_year: '2012', maximum_capacity: '50')
        Vehicle.create!(license_plate: 'KCP2489', brand: 'Ford', fabrication_year: '2009', maximum_capacity: '80')
        Vehicle.create!(license_plate: 'OPO5432', brand: 'BMW', fabrication_year: '2020', maximum_capacity: '100')       
        #Act
        login_as(user)
        visit(root_path)
        within('header nav') do 
            fill_in('Buscar Veículo', with: 'K')
            click_on('Buscar')
        end
        #Assert
        expect(current_path).to eq search_vehicles_path
        expect(page).to have_content('Resultados da Busca por: K')
        expect(page).to have_content('2 veículos encontrados')
        expect(page).to have_content('Placa: KPN3333')
        expect(page).to have_content('Marca: Toyota Corolla')
        expect(page).to have_content('Ano de Fabricação: 2012')
        expect(page).to have_content('Placa: KCP2489')
        expect(page).to have_content('Marca: Ford')
        expect(page).to have_content('Ano de Fabricação: 2009')
        expect(page).not_to have_content('Placa: OPO5432')
        expect(page).not_to have_content('Marca: BMW')
        expect(page).not_to have_content('Ano de Fabricação: 2020')
    end 
end 

