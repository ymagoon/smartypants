# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a = Bundle.new(name: "Cute Baby Toys", gender: "Female", age_group: "2T", price_per_day: 1, photo: "smarty-pants/li-tzuni-507346-unsplash.jpg", user_id: 1,  description: "Large Legos, Stuffed Animals, Rattles and more")
a.save!
b = Bundle.new(name: "Adorable Girls Clothes", gender: "Female", age_group: "18 to 24 months", price_per_day: 1, photo: "smarty-pants/accessories-adorable-baby-325867.jpg", user_id: 1,  description: "Pink everything from dresses to blankets to stuffed toys and socks")
b.save
c = Bundle.new(name: "Toddler Outfits for play", gender: "Male", age_group: "3T", price_per_day: 1, photo: "smarty-pants/baby-clothes-baby-shoes-booties-47220_1.jpg", user_id: 1,  description: "toddler clothes meant for a sandbox day out or a messy play doe session. Most have a few kid grass-stains, but no holes in the knees and well taken care of. " )
c.save
d =
d = Bundle.new(name: "Boys onsies", gender: "Male", age_group: "3 to 6 months", price_per_day: 1.5, photo: "smarty-pants/baby-clothes-baby-shoes-booties-47220_1.jpg", user_id: 1,  description: "there is a full shelf of onsies for that baby boy that keeps throwing up all over his clothes or decides to somehow make a mess of everything you've ever wanted to dress him up in. Handmade in Peru." )
c.save
