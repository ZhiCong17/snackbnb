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
OrderItem.destroy_all
Order.destroy_all
Snack.destroy_all
User.destroy_all

puts "Creating user..."
tom = User.create!(email: "tom@gmail.com", password: "password")
harry = User.create!(email: "harry@gmail.com", password: "password")

puts "Creating snacks..."
file = URI.open("https://shop.tonggarden.com.sg/media/catalog/product/cache/f2d087d5bbbebd2a5cd5b6c7e4ff7913/n/o/noi_potato_chips_salted_1_1.jpg")
potato_chips = Snack.new(name: "Potato Chips", description: "Deep fried until crunchy", price: 2.99, quantity: 20, user: tom)
potato_chips.photo.attach(io: file, filename: "potato_chips.jpg", content_type: "image/jpg")
potato_chips.save

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Green_and_Black%27s_dark_chocolate_bar_2.jpg/420px-Green_and_Black%27s_dark_chocolate_bar_2.jpg")
chocolate_bar = Snack.new(name: "Chocolate Bar", description: "made with organic dark chocoate", price: 4.99, quantity: 5, user: tom)
chocolate_bar.photo.attach(io: file, filename: "chocolate_bar.jpg", content_type: "image/jpg")
chocolate_bar.save

file = URI.open("https://m.media-amazon.com/images/I/516in4yx3ML._SL1500_.jpg")
gummy = Snack.new(name: "Gummy", description: "not overly sweet", price: 1.99, quantity: 10, user: tom)
gummy.photo.attach(io: file, filename: "gummy.jpg", content_type: "image/jpg")
gummy.save

file = URI.open("https://m.media-amazon.com/images/I/91HHkt8GruS._AC_UF894,1000_QL80_.jpg")
honey_twist = Snack.new(name: "Honey Twist", description: "A crispy, sweet snack", price: 2.99, quantity: 15, user: harry)
honey_twist.photo.attach(io: file, filename: "honey_twist.jpg", content_type: "image/jpg")
honey_twist.save

file = URI.open("https://m.media-amazon.com/images/I/61cXF2BTjNL._AC_UF894,1000_QL80_.jpg")
super_ring = Snack.new(name: "Super Ring", description: "Kids-all time favourite snack", price: 1.20, quantity: 30, user: harry)
super_ring.photo.attach(io: file, filename: "super_ring.jpg", content_type: "image/jpg")
super_ring.save

file = URI.open("https://i5.walmartimages.com/seo/OREO-Chocolate-Sandwich-Cookies-14-3-oz_fa1cdfc9-30cb-4ae1-aa9a-f4c85cbfd70f.d5bb6d8fac50a6a8e862a00d4de65f20.jpeg")
oreo = Snack.new(name: "Oreo", description: "Adults-all time favourite snack", price: 2, quantity: 10, user: harry)
oreo.photo.attach(io: file, filename: "oreo.jpg", content_type: "image/jpg")
oreo.save

file = URI.open("https://assets.caseys.com/m/1d7a9d5a10e1fe21/400x400-2840051647_base.PNG")
doritos = Snack.new(name: "Doritos", description: "Finger licking good", price: 2.99, quantity: 10, user: harry)
doritos.photo.attach(io: file, filename: "doritos.png", content_type: "image/png")
doritos.save

file = URI.open("https://img.freepik.com/free-psd/3d-cinema-icon-illustration-with-popcorn_23-2150629829.jpg?size=626&ext=jpg")
popcorn = Snack.new(name: "Popcorn", description: "Caramel flavored", price: 1.99, quantity: 10, user: harry)
popcorn.photo.attach(io: file, filename: "popcorn.jpg", content_type: "image/jpg")
popcorn.save

file = URI.open("https://thumbs.dreamstime.com/z/rainbow-swirl-lollipop-realistic-illustration-vector-152158546.jpg?ct=jpeg")
lollipop = Snack.new(name: "Lollipop", description: "Taste like rainbow", price: 1.99, quantity: 10, user: tom)
lollipop.photo.attach(io: file, filename: "lollipop.jpeg", content_type: "image/jpeg")
lollipop.save

file = URI.open("https://media.nedigital.sg/fairprice/fpol/media/images/product/XL/11720126_XL1_20220316.jpg")
almond = Snack.new(name: "Almond", description: "Taste like nuts", price: 4.99, quantity: 20, user: tom)
almond.photo.attach(io: file, filename: "almond.jpg", content_type: "image/jpg")
almond.save

file = URI.open("https://admin115421-prod.s3.ap-southeast-2.amazonaws.com/public/product-hrkM_HL9BJScBo10YjtYh-0-350-350.jpg")
twiggies = Snack.new(name: "Twiggies", description: "All time favourite", price: 2.50, quantity: 20, user: tom)
twiggies.photo.attach(io: file, filename: "twiggies.jpg", content_type: "image/jpg")
twiggies.save

file = URI.open("https://www.bigbasket.com/media/uploads/p/l/40196376_1-lotte-choco-pie-with-rich-marshmallow-premium-quality.jpg")
choco_pie = Snack.new(name: "Chocolate Pie", description: "Soft and fluffy", price: 2.80, quantity: 20, user: harry)
choco_pie.photo.attach(io: file, filename: "choco_pie.jpg", content_type: "image/jpg")
choco_pie.save

# puts "Creating order..."
# order1 = Order.create!(user: jia, status: "paid")
# order2 = Order.create!(user: ning)
# order3 = Order.create!(user: jia)

# puts "Creating order_list..."
# order_list1 = OrderItem.create!(order: order1, snack: gummy, snack_quantity: 5)
# order_list2 = OrderItem.create!(order: order1, snack: potato_chips, snack_quantity: 2)
# order_list3 = OrderItem.create!(order: order1, snack: super_ring, snack_quantity: 6)
# order_list4 = OrderItem.create!(order: order2, snack: chocolate_bar, snack_quantity: 1)
# order_list5 = OrderItem.create!(order: order2, snack: honey_twist, snack_quantity: 3)
# order_list6 = OrderItem.create!(order: order3, snack: honey_twist, snack_quantity: 3)
# order_list7 = OrderItem.create!(order: order3, snack: chocolate_bar, snack_quantity: 7)

puts "Finished!"
