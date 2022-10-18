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
PriceDistance.create(min_distance: 0, max_distance: 50, distance_price: 9.0, delivery_mode: delivery_mode_normal)
PriceDistance.create(min_distance: 51, max_distance: 150, distance_price: 12.0, delivery_mode: delivery_mode_normal)
PriceDistance.create(min_distance: 151, max_distance: 800, distance_price: 20.0, delivery_mode: delivery_mode_normal)
    #Entrega Expressa
PriceDistance.create(min_distance: 0, max_distance: 50, distance_price: 18.0, delivery_mode: delivery_mode_express)
PriceDistance.create(min_distance: 51, max_distance: 150, distance_price: 24.0, delivery_mode: delivery_mode_express)
PriceDistance.create(min_distance: 151, max_distance: 800, distance_price: 40.0, delivery_mode: delivery_mode_express)
#Prazos de Entrega
    #Entrega Normal
DeliveryTime.create(min_distance: 0, max_distance: 100, time: 48, delivery_mode: delivery_mode_normal)
DeliveryTime.create(min_distance: 101, max_distance: 300, time: 96, delivery_mode: delivery_mode_normal)
DeliveryTime.create(min_distance: 301, max_distance: 600, time: 144, delivery_mode: delivery_mode_normal)
DeliveryTime.create(min_distance: 601, max_distance: 900, time: 192, delivery_mode: delivery_mode_normal)
    #Entrega Expressa
DeliveryTime.create(min_distance: 0, max_distance: 100, time: 24, delivery_mode: delivery_mode_express)
DeliveryTime.create(min_distance: 101, max_distance: 300, time: 48, delivery_mode: delivery_mode_express)
DeliveryTime.create(min_distance: 301, max_distance: 600, time: 96, delivery_mode: delivery_mode_express)
DeliveryTime.create(min_distance: 601, max_distance: 900, time: 144, delivery_mode: delivery_mode_express)
#Ordens de Serviço
order = Order.create(sender_address: 'Rua Tabajara, 100', receiver_address: 'Rua Dois de Dezembro, 13', distance: 500, product_code: 'XPTO', 
            weight: 100, width: 123, height: 1000, receiver_name: 'Ana', status: :pending)
#Frete
#Em branco para ser executado

#Encerramento da Ordem
#Em branco para ser executado

