require 'rails_helper'

describe 'Usuário vê lista de pedidos' do
    
    it 'a partir da tela menu' do
        #Arrange
        #Act
        visit(root_path)
        within('nav') do
            click_on('Ordens de Serviço')
        end 
        #Assert
        expect(current_path).to eq orders_path
    end 

    it 'com sucesso' do
        #Arrange
        Order.create!(pick_up_address: 'Rua Tabajara, 100', code: 'ADCDEFG12345678', product_width: '20', product_height:'50', product_weight: 100, client_address:'Rua Dois de Dezembro, 13', client_name:'Ana', distance: 50)

        #Act
        visit(root_path)
        within('nav') do
            click_on('Ordens de Serviço')
        end 

        #Assert
        expect(page).to have_content('Ordens de Serviço')
        expect(page).to have_content('Ordem: ADCDEFG12345678')
    end 

    it 'não tem ordens de serviço cadastradas' do 
        #Arrange
        #Act
        visit(root_path)
        within('nav') do
            click_on('Ordens de Serviço')
        end 
        #Assert
        expect(page).to have_content('Não existem ordens de serviço cadastradas.')
    end 
end 