require 'rails_helper'

describe 'Usuário edita prazo' do
    
    it 'com sucesso' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 1, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        DeliveryTime.create!(max_distance: 10, min_distance: 0, time: 24, delivery_mode: delivery_mode)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Prazos de Entrega')
        click_on('Editar')
        fill_in('Distância Máxima', with: 10)
        fill_in('Distância Mínima', with: 5)
        fill_in('Prazo', with: 24)
        click_on('Enviar')
        #Assert
        expect(page).to have_content('Prazo atualizado com sucesso')
        expect(page).to have_content('Entrega Expressa')
        expect(page).to have_content('10 km')
        expect(page).to have_content('5 km')
        expect(page).to have_content('24 horas')
    end 

    it 'e mantém os campos obrigatórios' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 1, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        DeliveryTime.create!(max_distance: 10, min_distance: 0, time: 24, delivery_mode: delivery_mode)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Prazos de Entrega')
        click_on('Editar')
        fill_in('Distância Mínima', with: '')
        fill_in('Distância Máxima', with: '')
        fill_in('Prazo', with: '')
        click_on('Enviar')
        #Assert
        expect(page).to have_content('Não foi possível atualizar o prazo')
        expect(page).to have_content('Distância Mínima não pode ficar em branco')
        expect(page).to have_content('Distância Máxima não pode ficar em branco')
        expect(page).to have_content('Prazo não pode ficar em branco')
    end 

    it 'só se for admin' do
        #Arrange
        user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :regular_user)
        delivery_mode = DeliveryMode.create!(name: 'Entrega Expressa', minimum_distance: 1, maximum_distance: 800,
                                            minimum_weight: 2, maximum_weight: 100, initial_fee: 20)
        DeliveryTime.create!(max_distance: 10, min_distance: 0, time: 24, delivery_mode: delivery_mode)
        #Act
        login_as(user)
        visit(root_path)
        within('nav') do
            click_on('Preços e Prazos')
        end 
        click_on('Prazos de Entrega')
        #Assert
        expect(page).not_to have_content('Editar')
    end  
end