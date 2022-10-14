require 'rails_helper'

describe 'Usuário cadastra uma ordem de serviço' do

    it 'a partir da tela inicial' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        #Act
        login_as(user)
        visit(root_path)
        click_on('Criar Ordens de Serviço')

        #Assert
        expect(page).to have_field('Endereço do Remetente') 
        expect(page).to have_field('Endereço do Destinatário')
        expect(page).to have_field('Distância Percorrida')
        expect(page).to have_field('Peso')
        expect(page).to have_field('Altura')
        expect(page).to have_field('Largura')
        expect(page).to have_field('Nome do Destinatário')
        expect(page).to have_field('Código de Entrega')
    end 
    
    #it 'com sucesso' do
        #Arrange
        #user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        #Act
        #login_as(user)
        #visit(root_path)
        #click_on('Ordens de Serviço')
        #click_on('Cadastrar Ordem de Serviço')
        #fill_in('Endereço do Remetente', with: '')
        #fill_in('Endereço do Destinatário', with: '')
        #fill_in('Distância Percorrida', with:'')
        #fill_in('Peso', with:'')
        #fill_in('Altura', with:'')
        #fill_in('Largura', with:'')
        #fill_in('Nome do Destinatário', with:'')
        #fill_in('Código de Entrega', with:'')
        #click_on('Enviar')
        #Assert
        
    #end  




end 
