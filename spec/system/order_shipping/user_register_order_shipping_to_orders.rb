require 'rails helper'

describe ' Usuário inicia e cadastra informações de frete e entrega na ordem de serviço' do 
    
    it 'a partir da tela inicial' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        order = Order.create!(sender_address: 'Rua Tabajara, 100', receiver_address: 'Rua Dois de Dezembro, 13', distance: 500, 
                            product_code: 'XPTO', weight: 100, width: 123, height: 1000, receiver_name: 'Ana', status: :pending)
        #Act
        login_as(user)
        visit(root_path)
        click_on('Ordens de Serviço')
        click_on(order.delivery_code)
        click_on('Iniciar')
        #Assert
        expect(oage).to have_content('Calcular Frete e Entrega: Ordem de Serviço' (order.delivery_code))
        expect(page).to have_field('Modalidade de Entrega')
    end 

    it 'com sucesso' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        order = Order.create!(sender_address: 'Rua Tabajara, 100', receiver_address: 'Rua Dois de Dezembro, 13', distance: 500, 
                            product_code: 'XPTO', weight: 100, width: 123, height: 1000, receiver_name: 'Ana', status: :pending)
        #Act
        login_as(user)
        visit(root_path)
        click_on('Ordens de Serviço')
        click_on(order.delivery_code)
        click_on('Iniciar')
        select('Entrega Normal', from:'Modalidade de Entrega')
        #Assert
        expect(current_path).to eq @orders
        expect(page).to have_content('Modalidade de Entrega: Entrega Normal')
        expect(page).to have_content('Frete:')
        expect(page).to have_content('Prazo:')
        expect(page).to have_content('Veículo' (vehicle.brand_name))  
    end 
end 



