a = Bundle.new(name: "Cute Baby Toys", description: "You will love this bundle! It contains loads of fun toys your toddler will be able to play with.", gender: "Female", age_group: "2T", price_per_day: 1, user_id: 1)
a.remote_photo_url = "https://ae01.alicdn.com/kf/HTB1J2v6NXXXXXXtXXXXq6xXFXXXM/caterpillar-Soft-Toy-Doll-Rattle-Kids-Baby-Playmate-Toys-Calm-Owl-Doll-cute-peek-a-boo.jpg"
a.save!

i1 = Item.new(name: 'Cute playsuit', category: 'Playsuit', color: 'Green', condition:'Mint')
i1.bundle = a
i1.save

i2 = Item.new(name: 'Mickey Mouse Socks', category: 'Socks', color: 'Red', condition:'Used')
i2.bundle = a
i2.save

i3 = Item.new(name: 'Princess Onesie', category: 'Onesie', color: 'Pink', condition:'Used')
i3.bundle = a
i3.save

b = Bundle.new(name: "Adorable Girls Clothes", description: "A bunch of cute girls clothes, great for summer!", gender: "Female", age_group: "18 to 24 months", price_per_day: 1, photo: "smarty-pants/accessories-adorable-baby-325867.jpg", user_id: 1)
b.remote_photo_url = "https://ae01.alicdn.com/kf/HTB16sXnKFXXXXXrXFXXq6xXFXXXH/New-arrived-spring-Barbie-girls-clothing-set-adorable-twins-set-Girls-sports-outfit-DS5.jpg"
b.save!

c = Bundle.new(name: "Toddler Outfits for play", description: "Playtime has never been more fun! Perfect outfits for play", gender: "Male", age_group: "3T", price_per_day: 1, photo: "smarty-pants/baby-clothes-baby-shoes-booties-47220_1.jpg", user_id: 1)
c.remote_photo_url = "https://cdn7.bigcommerce.com/s-etgi42ttv9/product_images/theme_images/Boys_Slider_1_1.jpg?t=1525987576"
c.save!

d = Bundle.new(name: "Breezy Beach Bundle", description: "Everything you need for a fun weekend at the beach!", gender: "Female", age_group: "3T", price_per_day: 10, user_id: 1)
d.remote_photo_url = "http://res.cloudinary.com/cassysan/image/upload/v1526619735/uzhfxaxzu56atxxehpuv.jpg"
d.save!

e = Bundle.new(name: "Floral Flower Fairies" , description: "a bundle of gorgeous dresses that will keep any girlie girl happy all summer long. lots of colors and flower prints, tons of pinks bows and buttons and bobbles", gender: "Female" , age_group: "3T" , price_per_day: 5 , user_id: 1)
e.remote_photo_url = "http://res.cloudinary.com/cassysan/image/upload/v1526548938/bruno-nascimento-165629-unsplash.jpg"
e.save!

f = Bundle.new(name: "Tonka Truck Tots"  , description: "Clothes to play in all summer long that will hold up against grass stains and mud pies" , gender: "Male" , age_group: "12 to 18 months" , price_per_day: 2 , user_id: 1)
f.remote_photo_url = "http://res.cloudinary.com/cassysan/image/upload/v1526548938/bruno-nascimento-165629-unsplash.jpg"
f.save!

g = Bundle.new(name: "Play park kiddos", description: "Clothes that will keep your child warm in the crisp fall, Rain boots and jackets, thick jeans and tee shirts, long sleeve flannels and as many socks as the washing machine wont eat away", gender: "Male", age_group: "3T" , price_per_day: 6 , user_id: 1)
g.remote_photo_url = "http://res.cloudinary.com/cassysan/image/upload/v1526548924/myles-tan-84040-unsplash.jpg"
g.save!

h = Bundle.new(name: "The cutest dress up outfits" , description: "The cutest dress up outfits for your babe" , gender: "Male" , age_group: "6 to 9 months" , price_per_day: 3 , user_id: 1)
h.remote_photo_url = "http://res.cloudinary.com/cassysan/image/upload/v1526461935/smarty-pants/baby-clothes-baby-shoes-booties-47220_1.jpg"
h.save!

i = Bundle.new(name: "TOYS TOYS TOYS" , description: "Lions and tigers and bears oh my! just in miniature form, but they aren't legos so step on them as much as you want" , gender: "Male" , age_group: "18 to 24 months", price_per_day: 5 , user_id: 1)
i.remote_photo_url = "http://res.cloudinary.com/cassysan/image/upload/v1526461926/smarty-pants/animals-dinosaur-figurines-970206.jpg"
i.save!

j = Bundle.new(name: "All the goodies" , description: "Babes will love our toybox. you have all the things you could ever want for a growing mind" , gender: "Female" , age_group: "6 to 9 months" , price_per_day: 3 , user_id: 1)
j.remote_photo_url = "http://res.cloudinary.com/cassysan/image/upload/v1526461985/smarty-pants/li-tzuni-507346-unsplash.jpg"
j.save!

k = Bundle.new(name: "DO YOU LOVE ONESIES?!" , description: "YOU ARE GUNNA LOOOOOOOVE OUR ONSIES. PLAYFUL. CUTE. GREAT COLORS. EVERYTHING YOU COULD EVER WANT TO DRESS YOUR CHILD IN. IM NOT MAKING THIS UP IM SERIOUS HAVE YOU SEEN THESE ONSIES" , gender: "Female", age_group: "2T" , price_per_day: 3 , user_id: 1)
k.remote_photo_url = "http://res.cloudinary.com/cassysan/image/upload/v1526461952/smarty-pants/clean-cloth-clothing-41165.jpg"
k.save!
