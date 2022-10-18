# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#Usuários
User.create(name: 'Carlos', email: 'carlos@sistemadefrete.com.br', password: 'password', role: :admin)
User.create(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'password', role: :admin)
#Modalidades de Transporte
delivery_mode_normal = DeliveryMode.create(name: 'Entrega Normal', minimum_distance: 1.0, maximum_distance: 800.0, minimum_weight: 1.0, maximum_weight: 1000.0, initial_fee: 20.0)
delivery_mode_express = DeliveryMode.create(name: 'Entrega Expressa', minimum_distance: 1.0, maximum_distance: 200.0, minimum_weight: 1.0, maximum_weight: 50.0, initial_fee: 30.0)
#Veículos
Vehicle.create(license_plate: 'APG0504', brand: 'Caminhão Ford', fabrication_year: '2009', maximum_capacity: 800.0, delivery_mode: delivery_mode_normal, status: :available)
Vehicle.create(license_plate: 'KPN3333', brand: 'Van Chevrolet', fabrication_year: '2007', maximum_capacity: 200.0, delivery_mode: delivery_mode_normal, status: :available)
Vehicle.create(license_plate: 'POP1216', brand: 'Toyota Corolla', fabrication_year: '2015', maximum_capacity: 40.0, delivery_mode: delivery_mode_express, status: :available)
Vehicle.create(license_plate: 'SUP2039', brand: 'Motocicleta BMW', fabrication_year: '2020', maximum_capacity: 10.0, delivery_mode: delivery_mode_express, status: :available)
#Preços por Peso
    #Entrega Normal
PriceWeight.create(min_weight: 0, max_weight: 10, weight_price: 0.5, delivery_mode: delivery_mode_normal)
PriceWeight.create(min_weight: 11, max_weight: 30, weight_price: 0.8, delivery_mode: delivery_mode_normal)
PriceWeight.create(min_weight: 31, max_weight: 100, weight_price: 1.0, delivery_mode: delivery_mode_normal)
PriceWeight.create(min_weight: 101, max_weight: 1000, weight_price: 1.75, delivery_mode: delivery_mode_normal)
    #Entrega Expressa
PriceWeight.create(min_weight: 0, max_weight: 10, weight_price: 1.5, delivery_mode: delivery_mode_express)
PriceWeight.create(min_weight: 11, max_weight: 30, weight_price: 2.4, delivery_mode: delivery_mode_express)
PriceWeight.create(min_weight: 31, max_weight: 100, weight_price: 3.0, delivery_mode: delivery_mode_express)
PriceWeight.create(min_weight: 101, max_weight: 1000, weight_price: 5.25, delivery_mode: delivery_mode_express)
#Preços por Distância
    #Entrega Normal
    #Entrega Expressa

#Prazos de Entrega

#Ordens de Serviço

#Fretagem

#Dados de entrega/Encerramento da Ordem

