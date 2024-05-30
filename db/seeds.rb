# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
# User.destroy_all
Snack.destroy_all

puts "Creating user..."
jia = { email: "ho@hotmail.com", password: "jia123" }
ning = { email: "ning@gmail.com", password: "ning123" }

[jia, ning].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.email}"
end

puts "Creating snacks..."
potato_chips = { name: "Potato Chips", description: "A thin deposit of potato paste) that has been deep fried, baked, or air fried until crunchy", price: 5, quantity: 20, image_url: "https://admin115421-prod.s3.ap-southeast-2.amazonaws.com/public/product-zVPDCRRIjchw2A8tMLY5H-0.jpg", user_id: 2 }
chocolate_bar = { name: "Chocolate Bar", description: "made with organic dark chocoate ", price: 5, quantity: 20, image_url: "https://media.nedigital.sg/fairprice/fpol/media/images/product/XL/13002261_XL1_20210504.jpg?w=1200&q=70", user_id: 2 }
gummy = { name: "Gummy Bear", description: "not too sweet and acceptable ", price: 5, quantity: 20, image_url: "https://m.media-amazon.com/images/I/71MdYtRGloL._SL1500_.jpg", user_id: 2 }
honey_twist = { name: "honey Twist", description: "A crispy, sweet snack", price: 3, quantity: 15, image_url: "https://bluebasket.com/cdn/shop/products/1000037614306_i1_1200_1000x1000.jpg?v=1648546434", user_id: 1 }
super_ring = { name: "super ring", description: "Kids-all time favourite snack", price: 2.5, quantity: 30, image_url: "https://media.nedigital.sg/fairprice/fpol/media/images/product/XL/13019210_XL1_20230926.jpg", user_id: 1 }

[potato_chips, chocolate_bar, gummy, honey_twist, super_ring].each do |attributes|
  snack = Snack.create!(attributes)
  puts "Created #{snack.name}"
end
puts "Finished!"
