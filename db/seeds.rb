# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a = Bundle.new(name: "Cute Baby Toys", gender: "Female", age_group: "2T", price_per_day: 1, photo: "smarty-pants/li-tzuni-507346-unsplash.jpg", user_id: 1)
a.save!
b = Bundle.new(name: "Adorable Girls Clothes", gender: "Female", age_group: "18 to 24 months", price_per_day: 1, photo: "smarty-pants/accessories-adorable-baby-325867.jpg", user_id: 1)
b.save
c = Bundle.new(name: "Toddler Outfits for play", gender: "Male", age_group: "3T", price_per_day: 1, photo: "smarty-pants/baby-clothes-baby-shoes-booties-47220_1.jpg", user_id: 1)
c.save
