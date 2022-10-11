require 'rails_helper'

describe 'Usuário se autentica' do
    it 'com sucesso' do
        #Arrange

        #Act
        visit(root_path)
        click_on('Criar uma Conta')
        fill_in('Nome', with: 'Ana')
        fill_in('E-mail', with: 'ana@sistemadefrete.com.br')
        fill_in('Senha', with: 'password')
        fill_in('Confirme sua senha', with: 'password')
        click_on('Criar Conta')

        #Assert
        expect(page).to have_content('Boas vindas! Você realizou seu registro com sucesso.')
        expect(page).to have_content('ana@sistemadefrete.com.br')
        expect(page).to have_button('Sair')
        user = User.last
        expect(user.name). to eq 'Ana'
    end 

    it 'com dados obrigatórios' do 
        #Arrange

        #Act
        visit(root_path)
        click_on('Criar uma Conta')
        fill_in('Nome', with: '')
        fill_in('E-mail', with: '')
        fill_in('Senha', with: '')
        fill_in('Confirme sua senha', with: '')
        click_on('Criar Conta')
        #Assert
        expect(page).to have_content('E-mail não pode ficar em branco')
        expect(page).to have_content('Nome não pode ficar em branco')
        expect(page).to have_content('Senha não pode ficar em branco')
    end 
end 
