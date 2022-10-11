require 'rails_helper'

describe 'Usuário cadastra um veículo' do
    it 'a partir da tela inicial' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        #Act
        login_as(user)
        visit(root_path)
        click_on('Veículos')
        click_on('Cadastrar Veículo')

        #Assert
        expect(page).to have_field('Marca') 
        expect(page).to have_field('Placa')
        expect(page).to have_field('Ano de Fabricação')
        expect(page).to have_field('Capacidade Máxima')
    end 

    it 'com sucesso' do

        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        click_on('Cadastrar Veículo')
        fill_in('Marca', with: 'Toyota')
        fill_in('Placa', with: 'KPN3333')
        fill_in('Ano de Fabricação', with: '2012')
        fill_in('Capacidade Máxima', with: '100')
        click_on('Enviar')

        #Assert
        expect(page).to have_content('Veículo cadastrado com sucesso')
        expect(page).to have_content('Veículo: Toyota')
        expect(page).to have_content('Placa: KPN3333')
        expect(page).to have_content('Ano de Fabricação: 2012') 
        expect(page).to have_content('Capacidade Máxima: 100 kg')   
    end 

    it 'com dados incompletos' do 
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        click_on('Cadastrar Veículo')
        fill_in('Marca', with: '')
        fill_in('Placa', with: '')
        fill_in('Ano de Fabricação', with: '')
        fill_in('Capacidade Máxima', with: '')
        click_on('Enviar')

        #Assert
        expect(page).to have_content('Veículo não cadastrado')
        expect(page).to have_content('Marca não pode ficar em branco')
        expect(page).to have_content('Placa não pode ficar em branco')
        expect(page).to have_content('Ano de Fabricação não pode ficar em branco')
        expect(page).to have_content('Capacidade Máxima não pode ficar em branco')
    end 

    it 'apenas se for usuário admin' do
        #Arrange
        user = User.create!(name: 'Carlos', email: 'carlos@sistemadefrete.com.br', password: 'password', role: :regular_user)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Veículos')
        end 
        #Assert
        expect(page).not_to have_link('Cadastrar Veículo')
    end 
end 
