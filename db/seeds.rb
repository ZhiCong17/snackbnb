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
Snack.destroy_all

puts "Creating..."
Snack.create(name: "snack 001", description: "i am snack 1", quantity: 101, price: 1.5, image_url: "")
puts "snack 001"


puts "completed"
