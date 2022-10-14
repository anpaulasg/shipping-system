require 'rails_helper'

describe 'Usuário cadastra uma ordem de serviço' do

    it 'a partir da tela inicial' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        #Act
        login_as(user)
        visit(root_path)
        click_on('Cadastrar Ordens de Serviço')
        #Assert
        expect(page).to have_field('Nome do Destinatário')
        expect(page).to have_field('Endereço de Retirada') 
        expect(page).to have_field('Endereço de Entrega')
        expect(page).to have_field('Distância')
        expect(page).to have_field('Código do Produto')
        expect(page).to have_field('Altura da Carga')
        expect(page).to have_field('Largura da Carga')
        expect(page).to have_field('Peso da Carga')
    end 
    
    it 'com sucesso' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        allow(SecureRandom).to receive(:alphanumeric).and_return('ABCDEF123456789')
        #Act
        login_as(user)
        visit(root_path)
        click_on('Cadastrar Ordens de Serviço')
        fill_in('Nome do Destinatário', with: 'Ana')
        fill_in('Endereço de Retirada', with: 'Rua Tabajara, 100')
        fill_in('Endereço de Entrega', with: 'Rua Dois de Dezembro, 13')
        fill_in('Distância', with:'100 km')
        fill_in('Código do Produto', with:'XPTO456')
        fill_in('Altura da Carga', with:'10')
        fill_in('Largura da Carga', with: '20')
        fill_in('Peso da Carga', with: '20')
        click_on('Enviar')
        #Assert
        expect(page).to have_content('Ordem de Serviço cadastrada com sucesso')
        expect(page).to have_content('Nome do Destinatário: Ana')
        expect(page).to have_content('Endereço de Retirada: Rua Tabajara, 100') 
        expect(page).to have_content('Endereço de Entrega: Rua Dois de Dezembro, 13')
        expect(page).to have_content('Distância: 100 km')
        expect(page).to have_content('Código de Rastreamento: ABCDEF123456789' )
        expect(page).to have_content('Código do Produto: XPTO456')
        expect(page).to have_content('Dimensão: 10 cm x 20 cm')
        expect(page).to have_content('Peso da Carga: 20 kg')
    end 
    
    it 'só se for admin' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        #Act
        login_as(user)
        visit(root_path)
        #Assert
        expect(page).not_to have_content('Cadastrar Ordens de Serviço')
    end  
end 
