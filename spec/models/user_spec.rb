require 'rails_helper'

RSpec.describe User, type: :model do
    describe '#valid?' do
        context 'presence' do
            it 'false when name is empty' do
                #Arrange
                user = User.create(name: '', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
                #Act
                result = user.valid? 
    
                #Assert
                expect(result). to eq false 
            end 
    
            it 'false when password is empty' do
                #Arrange
                user = User.create(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: '', role: :admin)
                
                #Act
                result = user.valid? 
    
                #Assert
                expect(result). to eq false
            end
    
            it 'false when email is empty' do
              #Arrange
              user = User.create(name: 'Ana', email: '', password: 'password', role: :admin)
              #Act
              result = user.valid? 
    
              #Assert
              expect(result). to eq false
            end
        end 
    
        context 'use_already' do 
            it 'false when email is already in use' do 
                #Arrange
                first_user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
        
                second_user = User.create(name: 'Carlos', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
                #Act
                result = second_user.valid?
                #Assert 
                expect(result).to eq false
            end
        end 

        context 'email domain' do 
            it 'false when email has different domain' do 
                #Arrange
                user = User.create(name: 'Ana', email: 'ana@gmail.com.br', password: 'password', role: :admin)
                #Act
                result = user.valid?
                #Assert 
                expect(result).to eq false
            end
        end
        
        context 'user description' do 
            it 'shows the name and email at the same time' do
                #Arrange
                user = User.create(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
                #Act
                result = user.description()
                #Assert
                expect(result).to eq('Olá, Ana - ana@sistemadefrete.com.br')
            end
        end 
    end 
end
