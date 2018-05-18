# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = Bundle.new(name: "Cute Baby Toys", description: "Lots of fun toys for babies to play with!", gender: "Female", age_group: "2T", price_per_day: 1, user_id: 1)
a.remote_photo_url = "https://ae01.alicdn.com/kf/HTB1J2v6NXXXXXXtXXXXq6xXFXXXM/caterpillar-Soft-Toy-Doll-Rattle-Kids-Baby-Playmate-Toys-Calm-Owl-Doll-cute-peek-a-boo.jpg"
a.save!

b = Bundle.new(name: "Adorable Girls Clothes", description: "A bunch of cute girls clothes, great for summer!", gender: "Female", age_group: "18 to 24 months", price_per_day: 1, photo: "smarty-pants/accessories-adorable-baby-325867.jpg", user_id: 1)
b.remote_photo_url = "https://ae01.alicdn.com/kf/HTB16sXnKFXXXXXrXFXXq6xXFXXXH/New-arrived-spring-Barbie-girls-clothing-set-adorable-twins-set-Girls-sports-outfit-DS5.jpg"
b.save!

c = Bundle.new(name: "Toddler Outfits for play", description: "Playtime has never been more fun! Perfect outfits for play", gender: "Male", age_group: "3T", price_per_day: 1, photo: "smarty-pants/baby-clothes-baby-shoes-booties-47220_1.jpg", user_id: 1)
c.remote_photo_url = "https://cdn7.bigcommerce.com/s-etgi42ttv9/product_images/theme_images/Boys_Slider_1_1.jpg?t=1525987576"
c.save!

d = Bundle.new(name: "Breezy Beach Bundle", description: "Everything you need for a fun weekend at the beach!", gender: "Female", age_group: "3T", price_per_day: 10, user_id: 1)
d.remote_photo_url = "http://res.cloudinary.com/cassysan/image/upload/v1526619735/uzhfxaxzu56atxxehpuv.jpg"
d.save!

