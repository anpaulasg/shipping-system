require 'rails_helper'

describe 'Usuário vê detalhes de uma ordem de serviço' do
    it 'e vê informações adicionais' do
        #Arrange
        Order.create!(pick_up_address: 'Rua Tabajara, 100', code: 'ADCDEFG12345678', length: '10', product_width: '20', product_height:'50', product_weight: 100, client_address:'Rua Dois de Dezembro, 13', client_name:'Ana', distance: 50)

        #Act
        visit(root_path)
        click_on('Ordens de Serviço')
        click_on('ADCDEFG12345678')

        #Assert
        expect(page).to have_content('Cliente: Ana')
        expect(page).to have_content('Endereço de Retirada: Rua Tabajara, 100')
        expect(page).to have_content('Endereço de Entrega: Rua Dois de Dezembro, 13')
        expect(page).to have_content('Ordem: ADCDEFG12345678')
        expect(page).to have_content('Dimensão: 10 cm x 50 cm x 20 cm')
        expect(page).to have_content('Peso da Carga: 100.0 kg')
    end

    it 'e volta para a tela inicial' do
        #Arrange
        Order.create!(pick_up_address: 'Rua Tabajara, 100', code: 'ADCDEFG12345678', product_width: '20', product_height:'50', product_weight: 100, client_address:'Rua Dois de Dezembro, 13', client_name:'Ana', distance: 50)
        #Act
        visit(root_path)
        click_on('Ordens de Serviço')
        click_on('ADCDEFG12345678')
        click_on('Voltar')
        #Assert
        expect(current_path).to eq(orders_path)
    end 
end 