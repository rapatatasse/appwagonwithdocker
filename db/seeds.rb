# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Assurez-vous d'avoir inclus Faker en haut de votre fichier
require 'faker'
Product.destroy_all
# Créez une boucle pour créer 20 produits
20.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    comment: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    user_id: User.first.id,  
  )
end
put "20 products have been created"