require 'rails_helper'

describe 'Usuário cadastra uma modalidade de transporte' do
    it 'a partir da tela inicial' do
        #Arrange
        
        #Act
        visit(root_path)
        click_on('Cadastrar Modalidade de Transporte')

        #Assert
        expect(page).to have_field('Nome da Modalidade') 
        expect(page).to have_field('Distância Mínima')
        expect(page).to have_field('Distância Máxima')
        expect(page).to have_field('Peso Mínimo')
        expect(page).to have_field('Peso Máximo')
        expect(page).to have_field('Taxa Fixa')
    end 

    it 'com sucesso' do
        #Arrange
        
        #Act
        visit(root_path)
        click_on('Cadastrar Modalidade de Transporte')
        fill_in('Nome da Modalidade', with: 'Entrega Expressa')
        fill_in('Distância Mínima', with: '1')
        fill_in('Distância Máxima', with: '500')
        fill_in('Peso Mínimo', with: '1')
        fill_in('Peso Máximo', with: '100')
        fill_in('Taxa Fixa', with: '10')
        click_on('Enviar')

        #Assert
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Modalidade de Transporte cadastrada com sucesso.')
        expect(page).to have_content('Entrega Expressa')
    end 

    it 'com dados incompletos' do 
        #Arrange
        #Act
        visit(root_path)
        click_on('Cadastrar Modalidade de Transporte')
        fill_in('Nome da Modalidade', with: '')
        fill_in('Distância Mínima', with: '')
        fill_in('Distância Máxima', with: '')
        fill_in('Peso Mínimo', with: '')
        fill_in('Peso Máximo', with: '')
        fill_in('Taxa Fixa', with: '')
        click_on('Enviar')

        #Assert
        expect(page).to have_content('Modalidade de Transporte não cadastrada.')
        expect(page).to have_content('Nome da Modalidade não pode ficar em branco')
        expect(page).to have_content('Peso Mínimo não pode ficar em branco')
        expect(page).to have_content('Peso Máximo não pode ficar em branco')
        expect(page).to have_content('Taxa Fixa não pode ficar em branco')
    end 
end 