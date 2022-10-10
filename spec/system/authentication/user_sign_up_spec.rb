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
end 
