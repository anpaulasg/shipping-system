require 'rails_helper'

describe 'Usuário se autentica' do
    it 'com sucesso' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        #Act
        visit(root_path)
        within('header nav') do 
            click_on('Entrar')
        end 
        fill_in('E-mail', with: 'ana@sistemadefrete.com.br')
        fill_in('Senha', with: 'password')
        within('main') do 
            click_on('Entrar')
        end 
        
        #Assert
        expect(page).to have_content('Login efetuado com sucesso.')
        within('nav') do 
            expect(page).not_to have_link('Entrar')
            expect(page).to have_button('Sair')
            expect(page).to have_content('Olá, Ana - ana@sistemadefrete.com.br')
        end 
    end 

    it 'e faz logout' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        #Act
        visit(root_path)
        within('header nav') do 
            click_on('Entrar')
        end 
        fill_in('E-mail', with: 'ana@sistemadefrete.com.br')
        fill_in('Senha', with: 'password')
        within('main') do 
            click_on('Entrar')
        end
        within('nav') do 
            click_on('Sair')
        end 
        within('nav') do 
            expect(page).to have_link('Entrar')
            expect(page).not_to have_button('Sair')
            expect(page).not_to have_content('ana@sistemadefrete.com.br')
        end 
    end 
end