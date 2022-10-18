require 'rails_helper'

describe 'Usuário vê detalhes de uma ordem de serviço' do

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

        #Assert
        expect(page).to have_content('Ordem de Serviço:')
        expect(page).to have_content(order.delivery_code)
        expect(page).to have_content('Nome do Destinatário: Ana')
        expect(page).to have_content('Endereço de Retirada: Rua Tabajara, 100')
        expect(page).to have_content('Endereço de Entrega: Rua Dois de Dezembro, 13')
        expect(page).to have_content('Distância: 500 km')
        expect(page).to have_content('Código do Produto: XPTO')
    end 

    it 'e volta para a lista/tela inicial de ordens de serviço' do 

        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        order = Order.create!(sender_address: 'Rua Tabajara, 100', receiver_address: 'Rua Dois de Dezembro, 13', distance: 500, 
                             product_code: 'XPTO', weight: 100, width: 123, height: 1000, receiver_name: 'Ana', status: :pending)
        #Act
        login_as(user)
        visit(root_path)
        click_on('Ordens de Serviço')
        click_on(order.delivery_code)
        click_on('Voltar')
        #Assert
        expect(current_path).to eq orders_path
    end 
end 