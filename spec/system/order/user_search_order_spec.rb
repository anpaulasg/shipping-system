require 'rails_helper'

describe 'Visitante procura ordem de serviço' do

    it 'a partir do menu' do 
        #Arrange
        #Act
        visit(root_path)
        #Assert
        expect(page).to have_field('Consultar Entrega')
        expect(page).to have_button('Consultar')
    end
    
    it 'e encontra informações de entrega' do
        #Arrange
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 1, maximum_distance: 200,
                                             minimum_weight: 1, maximum_weight: 50, initial_fee: 30)
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        chosen_vehicle = Vehicle.create!(license_plate: 'KPN3333', brand: 'Van Chevrolet', fabrication_year: '2007', maximum_capacity: 200.0, 
            delivery_mode: delivery_mode, status: :available)
        order = Order.create!(sender_address: 'Rua Tabajara, 100', receiver_address: 'Rua Dois de Dezembro, 13', distance: 500, 
                        product_code: 'XPTO', weight: 100, width: 123, height: 1000, receiver_name: 'Ana', status: :pending)
        allow(SecureRandom).to receive(:alphanumeric).and_return('ABCDEF123456789')
        order_shipping = OrderShipping.create!(final_price: 1570.0, final_term: 96, delivery_mode: delivery_mode, order: order, chosen_vehicle: chosen_vehicle.brand)
        
        #Act
        visit(root_path)
         
        fill_in('Consultar Entrega', with: 'ABCDEF123456789')
        click_on('Consultar')
        #Assert
        expect(current_path).to eq search_orders_path
        expect(page).to have_content('Resultados da Consulta por: ABCDEF123456789')
        #expect(page).to have_content('1 ordem de serviço encontrada')
        #expect(page).to have_content('Placa: KPN3333')
        #expect(page).to have_content('Marca: Toyota Corolla')
        #expect(page).to have_content('Ano de Fabricação: 2012')
        #expect(page).to have_content('Status: Disponível')
        #expect(page).not_to have_content('Placa: KCP2489')
        #expect(page).not_to have_content('Marca: Ford')
        #expect(page).not_to have_content('Ano de Fabrição: 2009')
    end 
end 

