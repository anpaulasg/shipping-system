require 'rails_helper'

RSpec.describe User, type: :model do
    describe '#valid?' do
        context 'presence' do
            it 'false when name is empty' do
                #Arrange
                user = User.create(name: '', email: 'ana@sistemadefrete.com.br', password: 'password')
                #Act
                result = user.valid? 
    
                #Assert
                expect(result). to eq false 
            end 
    
            it 'false when password is empty' do
                #Arrange
                user = User.create(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: '')
                
                #Act
                result = user.valid? 
    
                #Assert
                expect(result). to eq false
            end
    
            it 'false when email is empty' do
              #Arrange
              user = User.create(name: 'Ana', email: '', password: 'password')
              #Act
              result = user.valid? 
    
              #Assert
              expect(result). to eq false
            end
        end 
    
        context 'use_already' do 
            it 'false when email is already in use' do 
                #Arrange
                first_user = User.create(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
        
                second_user = user = User.create(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password')
                #Act
                result = second_user.valid?
                #Assert 
                expect(result).to eq false
            end
        end 

        context 'email domain' do 
            it 'false when email has different domain' do 
                #Arrange
                user = User.create(name: 'Ana', email: 'ana@gmail.com.br', password: 'password')
                #Act
                result = user.valid?
                #Assert 
                expect(result).to eq false
            end
        end    
    end 
end
