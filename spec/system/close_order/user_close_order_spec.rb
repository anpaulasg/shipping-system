require 'rails_helper'

describe 'Usuário encerra ordem de serviço' do

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
        click_on('Encerrar')
        #Assert
        expect(page).to have_content('Cadastrar Data da Entrega')
        expect(page).to have_field('Data da Entrega')
    end 
end 