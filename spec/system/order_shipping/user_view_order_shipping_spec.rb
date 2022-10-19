require 'rails_helper'

describe 'Usuário vê frete e informações de frete e entrega' do
  
  it 'e deve estar autenticado' do  
    #Arrange
    
    #Act
    visit(root_path)
    click_on('Ordens de Serviço')
    #Assert
    expect(current_path).to eq new_user_session_path
  end

  it 'com sucesso' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        order = Order.create!(sender_address: 'Rua Tabajara, 100', receiver_address: 'Rua Dois de Dezembro, 13', distance: 500, 
                        product_code: 'XPTO', weight: 100, width: 123, height: 1000, receiver_name: 'Ana', status: :pending)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 1, maximum_distance: 200,
                                            minimum_weight: 1, maximum_weight: 50, initial_fee: 30)
        chosen_vehicle = Vehicle.create!(license_plate: 'KPN3333', brand: 'Van Chevrolet', fabrication_year: '2007', maximum_capacity: 200.0, 
                                delivery_mode: delivery_mode, status: :available)
        order_shipping = OrderShipping.create!(final_price: 1570.0, final_term: 96, delivery_mode: delivery_mode, order: order, chosen_vehicle: chosen_vehicle.brand)
        #Act
        login_as(user)
        visit(root_path)
        click_on('Ordens de Serviço')
        click_on(order.delivery_code)

        #Assert
        expect(page).to have_content('Status: Iniciada')
        expect(page).to have_content('Informações | Frete e Entrega')
        expect(page).to have_content('Modalidade de Entrega: Entrega Expressa')
        expect(page).to have_content('Frete: R$ 1570.0')
        expect(page).to have_content('Prazo de Entrega: 96h')
        expect(page).to have_content('Van Chevrolet')
  end 

    it 'e não existe informações de frete cadastradas' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        order = Order.create!(sender_address: 'Rua Tabajara, 100', receiver_address: 'Rua Dois de Dezembro, 13', distance: 500, 
                        product_code: 'XPTO', weight: 100, width: 123, height: 1000, receiver_name: 'Ana', status: :pending)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 1, maximum_distance: 200,
                                            minimum_weight: 1, maximum_weight: 50, initial_fee: 30)
        chosen_vehicle = Vehicle.create!(license_plate: 'KPN3333', brand: 'Van Chevrolet', fabrication_year: '2007', maximum_capacity: 200.0, 
                                delivery_mode: delivery_mode, status: :available)
        #Act
        login_as(user)
        visit(root_path)
        click_on('Ordens de Serviço')
        click_on(order.delivery_code)
        #Assert
        expect(page).to have_content('Status: Pendente')
        expect(page).to have_content('Informações | Frete e Entrega')
        expect(page).to have_content('Não há informações de frete e entrega cadastradas.')
    end
end 