require 'open-uri'

School.destroy_all
puts 'All schools destroyed ...'
Shop.destroy_all
puts 'All shops destroyed ...'
BlogPage.destroy_all
puts 'All blogpages destroyed ...'
User.destroy_all
puts 'All users destroyed ...'
Spot.destroy_all
puts 'All spots destroyed ...'
Location.destroy_all
puts 'All locations destroyed ...'
puts '-------------------------------'

# User seeds
user1_img = URI.open('https://res.cloudinary.com/deewxzlno/image/upload/v1724074421/production/avatars/u46sxktotibbrjhhjsym.jpg')
user1 = User.create!(
  first_name: 'Clément',
  last_name: 'Chappron',
  email: 'clement.chappron@gmail.com',
  address: '13D rue des terminalias, Tamarin, Mauritius',
  password: 'password',
  password_confirmation: 'password',
)
user1.profile_picture.attach(io: user1_img, filename: 'user1.jpg', content_type: 'image/jpg')
user1.save
puts "User #{user1.first_name} #{user1.last_name} created ..."

user2_img = URI.open('https://res.cloudinary.com/deewxzlno/image/upload/v1724074422/production/avatars/fxstnxf6mudy64ohbug1.jpg')
user2 = User.create!(
  first_name: 'Eldave',
  last_name: 'Dibala',
  email: 'ed@mail.com',
  address: 'Casablanca, Morocco',
  password: 'password',
  password_confirmation: 'password',
)
user2.profile_picture.attach(io: user2_img, filename: 'user2.jpg', content_type: 'image/jpg')
user2.save
puts "User #{user2.first_name} #{user2.last_name} created ..."

user3_img = URI.open('https://res.cloudinary.com/deewxzlno/image/upload/v1724074421/production/avatars/zqf6zhn2lbkx0iaoexn7.jpg')
user3 = User.create!(
  first_name: 'Avinash',
  last_name: 'Daby',
  email: 'ad@mail.com',
  address: 'Moka, Mauritius',
  password: 'password',
  password_confirmation: 'password',
)
user3.profile_picture.attach(io: user3_img, filename: 'user3.jpg', content_type: 'image/jpg')
user3.save
puts "User #{user3.first_name} #{user3.last_name} created ..."

user4_img = URI.open('https://res.cloudinary.com/deewxzlno/image/upload/v1724074421/production/avatars/fvpxbivbzkzu01budynj.jpg')
user4 = User.create!(
  first_name: 'Lalenee',
  last_name: 'Sahye',
  email: 'ls@mail.com',
  address: 'Port Louis, Mauritius',
  password: 'password',
  password_confirmation: 'password',
)
user4.profile_picture.attach(io: user4_img, filename: 'user4.jpg', content_type: 'image/jpg')
user4.save
puts "User #{user4.first_name} #{user4.last_name} created ..."

puts 'All users created ...'
puts '-------------------------------'



# Location seeds
puts 'Creating locations...'

north_location = Location.create!(
  name: "The North",
  description: "The North of Mauritius is known for its beautiful beaches, crystal-clear waters, and luxury resorts. It is a vibrant area with plenty of restaurants, shops, and water activities."
)
north_location.save
puts "Location #{north_location.name} created ..."

west_coast_location = Location.create!(
  name: "West coast",
  description: "The West Coast of Mauritius is renowned for its spectacular sunsets and white sandy beaches. The area offers a more relaxed atmosphere with options for boat trips and nature explorations."
)
west_coast_location.save
puts "Location #{west_coast_location.name} created ..."

est_coast_location = Location.create!(
  name: "East coast",
  description: "The East Coast is famous for its peaceful beaches and turquoise lagoons. It is a quieter area with opportunities to explore local culture and engage in activities such as kite surfing and snorkeling."
)
est_coast_location.save
puts "Location #{est_coast_location.name} created ..."

south_location = Location.create!(
  name: "The South",
  description: "The South of Mauritius is a more rugged and unspoiled region, featuring breathtaking landscapes such as waterfalls and gorges. It's an ideal spot for nature enthusiasts and adventure seekers."
)
south_location.save
puts "Location #{south_location.name} created ..."

south_est_coast_location = Location.create!(
  name: "South East coast",
  description: "The South East Coast of Mauritius combines natural beauty with serenity. This region offers tranquil beaches, nature reserves, and opportunities for water sports, while retaining an authentic charm."
)
south_est_coast_location.save
puts "Location #{south_est_coast_location.name} created ..."

puts 'All locations created'
puts '-------------------------------'

# Spots seeds

# Seeds for kitesurfing spots in Mauritius
puts 'Creating spots...'

le_morne_img1 = URI.open('https://sportihome.com/uploads/spots/587e6f0ebcc3d4e1419df327/large/IMG_4667.jpg')
le_morne_img2 = URI.open('https://i0.wp.com/isabellefabre.fr/wp-content/uploads/DJI_0566.jpg?resize=1170%2C780&ssl=1')
le_morne_img3 = URI.open('https://www.iksurfmag.com/wp-content/uploads/2015/08/IMG_2609.jpg')

le_morne = Spot.create!(
  name: "Le Morne",
  description: "One of the most popular kitesurfing spots on the island, offering perfect conditions for both beginners and experts. There are several zones for kiting, ranging from flat water in the lagoon to waves for the more experienced.",
  level: "All levels",
  location_id: south_location.id
)
le_morne.images.attach(io: le_morne_img1, filename: 'le_morne1.jpg', content_type: 'image/jpg')
le_morne.images.attach(io: le_morne_img2, filename: 'le_morne2.jpg', content_type: 'image/jpg')
le_morne.images.attach(io: le_morne_img3, filename: 'le_morne3.jpg', content_type: 'image/jpg')
le_morne.save
puts "Spot #{le_morne.name} created ..."

pointe_desny_img1 = URI.open('https://kitetrip-planner.com/wp-content/uploads/2018/03/ile-maurice-pointe-desny-new.jpg')
pointe_desny_img2 = URI.open('https://spots-evasion.com/wp-content/uploads/2022/07/Maurice-kite-pointe-desny-4.jpg')
pointe_desny_img3 = URI.open('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/00/1e/8d/the-beach.jpg?w=1200&h=-1&s=1')

pointe_desny = Spot.create!(
  name: "Pointe d'Esny",
  description: "Located near Mahébourg, this spot offers a long white sandy beach and a shallow lagoon ideal for beginners. It's a less crowded spot compared to Le Morne.",
  level: "Beginners to intermediates",
  location_id: south_est_coast_location.id
)
pointe_desny.images.attach(io: pointe_desny_img1, filename: 'pointe_desny1.jpg', content_type: 'image/jpg')
pointe_desny.images.attach(io: pointe_desny_img2, filename: 'pointe_desny2.jpg', content_type: 'image/jpg')
pointe_desny.images.attach(io: pointe_desny_img3, filename: 'pointe_desny3.jpg', content_type: 'image/jpg')
pointe_desny.save
puts "Spot #{pointe_desny.name} created ..."

bel_ombre_img1 = URI.open('https://www.planetkitesurfholidays.com/images/header/bel_ombre.jpeg')
bel_ombre_img2 = URI.open('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/b2/dd/2b/kitsurf-event.jpg?w=1200&h=1200&s=1')
bel_ombre_img3 = URI.open('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/b2/e7/40/event-at-bel-ombre.jpg?w=1200&h=900&s=1')

bel_ombre = Spot.create!(
  name: "Bel Ombre",
  description: "Another spot on the southwest coast, offering varied conditions with protected lagoon areas for beginners and waves for more advanced kitesurfers.",
  level: "All levels",
  location_id: south_location.id
)
bel_ombre.images.attach(io: bel_ombre_img1, filename: 'bel_ombre1.jpg', content_type: 'image/jpg')
bel_ombre.images.attach(io: bel_ombre_img2, filename: 'bel_ombre2.jpg', content_type: 'image/jpg')
bel_ombre.images.attach(io: bel_ombre_img3, filename: 'bel_ombre3.jpg', content_type: 'image/jpg')
bel_ombre.save
puts "Spot #{bel_ombre.name} created ..."

poste_lafayette_img1 = URI.open('https://kitetrip-planner.com/wp-content/uploads/2018/03/poste-lafayette-new.jpg')
poste_lafayette_img2 = URI.open('https://www.bookmauritius-villas.com/wp-content/uploads/2021/07/kite-poste-lafayette-mauritius-1.jpg')
poste_lafayette_img3 = URI.open('https://image-stock2.mercuryholidays.co.uk/resized/scenery/indian-ocean/mauritius/east-coast-mauritius/poste-lafayette/poste-lafayette-beach-w1920.jpg')

poste_lafayette = Spot.create!(
  name: "Poste Lafayette",
  description: "Located on the east coast, Poste Lafayette is a windy spot with moderate waves. The wind is stronger here than on the west coast, and the conditions are more challenging.",
  level: "Intermediates to experts",
  location_id: est_coast_location.id
)
poste_lafayette.images.attach(io: poste_lafayette_img1, filename: 'poste_lafayette1.jpg', content_type: 'image/jpg')
poste_lafayette.images.attach(io: poste_lafayette_img2, filename: 'poste_lafayette2.jpg', content_type: 'image/jpg')
poste_lafayette.images.attach(io: poste_lafayette_img3, filename: 'poste_lafayette3.jpg', content_type: 'image/jpg')
poste_lafayette.save
puts "Spot #{poste_lafayette.name} created ..."

anse_la_rae_img1 = URI.open('https://www.ion-club.net/wp-content/uploads/2023/10/kitesurf2.jpg')
anse_la_rae_img2 = URI.open('https://cdn.prod.website-files.com/62705a7fe5df572cc1371af5/62d67f23a704c5806dc568b5_spot-anse-la-raie-drone-scaled.jpeg')
anse_la_rae_img3 = URI.open('https://wordpress.wihphotels.com/mythic/media/sites/35/2019/06/a-la-decouverte-des-plus-belles-vagues-de-kitesurf-du-nord-de-lile-maurice.jpg')

anse_la_rae = Spot.create!(
  name: "Anse la Raie",
  description: "Located in the north of the island, Anse la Raie is a peaceful spot with a shallow lagoon, perfect for beginners and those looking for a less crowded spot.",
  level: "Beginners to intermediates",
  location_id: north_location.id
)
anse_la_rae.images.attach(io: anse_la_rae_img1, filename: 'anse_la_rae1.jpg', content_type: 'image/jpg')
anse_la_rae.images.attach(io: anse_la_rae_img2, filename: 'anse_la_rae2.jpg', content_type: 'image/jpg')
anse_la_rae.images.attach(io: anse_la_rae_img3, filename: 'anse_la_rae3.jpg', content_type: 'image/jpg')
anse_la_rae.save
puts "Spot #{anse_la_rae.name} created ..."

trou_deau_douce_img1 = URI.open('https://www.oazure.com/media/367570/a-la-decouverte-de-trou-d-eau-douce.jpg?crop=0,0,0,0.10303030303030308&cropmode=percentage&width=880&height=444&rnd=132937309150000000')
trou_deau_douce_img2 = URI.open('https://www.papillesetpupilles.fr/opengraph_image/29032')
trou_deau_douce_img3 = URI.open('https://lemandalamoris.com/wp-content/uploads/2024/03/trou-dE28099eau-douce2C-village-pittoresque-a-l26rsquo3Bile-maurice.jpg')

trou_deau_douce = Spot.create!(
  name: "Trou d'Eau Douce",
  description: "A spot on the east coast offering ideal conditions for freeriding with an extensive lagoon and consistent trade winds.",
  level: "All levels",
  location_id: est_coast_location.id
)
trou_deau_douce.images.attach(io: trou_deau_douce_img1, filename: 'trou_deau_douce1.jpg', content_type: 'image/jpg')
trou_deau_douce.images.attach(io: trou_deau_douce_img2, filename: 'trou_deau_douce2.jpg', content_type: 'image/jpg')
trou_deau_douce.images.attach(io: trou_deau_douce_img3, filename: 'trou_deau_douce3.jpg', content_type: 'image/jpg')
trou_deau_douce.save
puts "Spot #{trou_deau_douce.name} created ..."

la_prairie_img1 = URI.open('https://explora.mu/media/k2/items/cache/24f275a0444b02388db3d9fa6679982f_XL.jpg?t=20220131_182609')
la_prairie_img2 = URI.open('https://www.ile-maurice.fr/images/Actualites/kitesurf-le-morne-maurice.jpg')
la_prairie_img3 = URI.open('https://www.ivisitplus-maurice.com/wp-content/uploads/2018/04/5-SONOFKITE-LAGON.jpg')

la_prairie = Spot.create!(
  name: "La Prairie",
  description: "Located near Le Morne, this spot is ideal for beginners thanks to its shallow waters and protected lagoon.",
  level: "Beginners",
  location_id: south_location.id
)
la_prairie.images.attach(io: la_prairie_img1, filename: 'la_prairie1.jpg', content_type: 'image/jpg')
la_prairie.images.attach(io: la_prairie_img2, filename: 'la_prairie2.jpg', content_type: 'image/jpg')
la_prairie.images.attach(io: la_prairie_img3, filename: 'la_prairie3.jpg', content_type: 'image/jpg')
la_prairie.save
puts "Spot #{la_prairie.name} created ..."

palmar_img1 = URI.open('https://fun-and-fly.com/wp-content/uploads/pgi/brut/card_jpg/SPOT__LOCATION_DOC_427.jpg')
palmar_img2 = URI.open('https://spots-evasion.com/wp-content/uploads/2022/05/sejour-kite-C-Mauritius-4.jpg')
palmar_img3 = URI.open('https://fun-and-fly.com/wp-content/uploads/pgi/brut/SPOT__LOCATION_DOC_821.jpg')

palmar = Spot.create!(
  name: "Palmar",
  description: "A lesser-known spot with great potential, offering good conditions for intermediate and advanced kitesurfers.",
  level: "Intermediates to experts",
  location_id: est_coast_location.id
)
palmar.images.attach(io: palmar_img1, filename: 'palmar1.jpg', content_type: 'image/jpg')
palmar.images.attach(io: palmar_img2, filename: 'palmar2.jpg', content_type: 'image/jpg')
palmar.images.attach(io: palmar_img3, filename: 'palmar3.jpg', content_type: 'image/jpg')
palmar.save
puts "Spot #{palmar.name} created ..."

grand_baie_img3 = URI.open('https://www.villa-vie.com/wp-content/uploads/2022/09/Samples1_HR-164-1-scaled.jpg')
grand_baie_img1 = URI.open('https://ilemauricehotels.com/data/images/discover-mauritius/kitesurf/mauritius-kitesurfing%20(5).jpg')
grand_baie_img2 = URI.open('https://www.mauritius-travel.com/images/LieuxActivites/galerie/image-843.jpg')

grand_baie = Spot.create!(
  name: "Grand Baie",
  description: "Primarily a leisure spot, Grand Baie also offers some kitesurfing opportunities when the wind is favorable.",
  level: "Intermediates",
  location_id: north_location.id
)
grand_baie.images.attach(io: grand_baie_img1, filename: 'grand_baie1.jpg', content_type: 'image/jpg')
grand_baie.images.attach(io: grand_baie_img2, filename: 'grand_baie2.jpg', content_type: 'image/jpg')
grand_baie.images.attach(io: grand_baie_img3, filename: 'grand_baie3.jpg', content_type: 'image/jpg')
grand_baie.save
puts "Spot #{grand_baie.name} created ..."

ile_aux_cerfs_img1 = URI.open('https://spots-evasion.com/wp-content/uploads/2016/12/Ile-Maurice-kitesurf-windsurf-plong%C3%A9e-ile-aux-cerfs-.jpg')
ile_aux_cerfs_img2 = URI.open('https://i0.wp.com/isabellefabre.fr/wp-content/uploads/DJI_0441.jpg?ssl=1')
ile_aux_cerfs_img3 = URI.open('https://www.tropicalement-votre.com/dests/maurice/ile-aux-cerfs-maurice.jpg')

ile_aux_cerfs = Spot.create!(
  name: "Île aux Cerfs",
  description: "Accessible by boat, this spot is perfect for a kitesurfing session in a beautiful setting, with a turquoise lagoon and moderate wind conditions.",
  level: "Intermediates",
  location_id: est_coast_location.id
)
ile_aux_cerfs.images.attach(io: ile_aux_cerfs_img1, filename: 'ile_aux_cerfs1.jpg', content_type: 'image/jpg')
ile_aux_cerfs.images.attach(io: ile_aux_cerfs_img2, filename: 'ile_aux_cerfs2.jpg', content_type: 'image/jpg')
ile_aux_cerfs.images.attach(io: ile_aux_cerfs_img3, filename: 'ile_aux_cerfs3.jpg', content_type: 'image/jpg')
ile_aux_cerfs.save
puts "Spot #{ile_aux_cerfs.name} created ..."

flic_en_flac_img1 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Mauritius_flic_en_flac_beach.jpg/1200px-Mauritius_flic_en_flac_beach.jpg')
flic_en_flac_img2 = URI.open('https://www.tropicalement-votre.com/dests/maurice/plage-flic-en-flac-ile-maurice.jpg')
flic_en_flac_img3 = URI.open('https://visit.today/images/elements/upload/full/Flic-Flac-1.jpg')

flic_en_flac = Spot.create!(
  name: "Flic en Flac",
  description: "Primarily known for diving, Flic en Flac can sometimes offer interesting conditions for kitesurfing, especially for beginners looking to learn in calm waters.",
  level: "Beginners",
  location_id: west_coast_location.id
)
flic_en_flac.images.attach(io: flic_en_flac_img1, filename: 'flic_en_flac1.jpg', content_type: 'image/jpg')
flic_en_flac.images.attach(io: flic_en_flac_img2, filename: 'flic_en_flac2.jpg', content_type: 'image/jpg')
flic_en_flac.images.attach(io: flic_en_flac_img3, filename: 'flic_en_flac3.jpg', content_type: 'image/jpg')
flic_en_flac.save
puts "Spot #{flic_en_flac.name} created ..."

puts 'All spots created'
puts '-------------------------------'

# Schools seeds
puts 'Creating schools...'

schools = [
  {
    name: 'Ocean Academy',
    address: 'Blue Bay, Mauritius',
    phone: '+230 1234567',
    website: 'http://oceanacademy.mu',
    email: 'info@oceanacademy.mu',
    description: 'A top-notch kitesurf school with a focus on safety and fun.',
    rental: true,
    levels: 'All levels',
    fee: '50',
    facebook: 'https://www.facebook.com/oceanacademy',
    instagram: 'https://www.instagram.com/oceanacademy',
    location_id: south_location.id,
    user: user1
  },
  {
    name: 'Wave Riders School',
    address: 'Le Morne, Mauritius',
    phone: '+230 9876543',
    website: 'http://waveriders.mu',
    email: 'contact@waveriders.mu',
    description: 'Professional kitesurfing lessons in the heart of Le Morne.',
    rental: true,
    levels: 'Beginners to experts',
    fee: '70',
    facebook: 'https://www.facebook.com/waveriders',
    instagram: 'https://www.instagram.com/waveriders',
    location_id: south_location.id,
    user: user2
  },
  {
    name: 'KiteXperience',
    address: 'Belle Mare, Mauritius',
    phone: '+230 2345678',
    website: 'http://kitexperience.mu',
    email: 'hello@kitexperience.mu',
    description: 'Personalized kiteboarding lessons for all skill levels.',
    rental: false,
    levels: 'Intermediate to experts',
    fee: '80',
    facebook: 'https://www.facebook.com/kitexperience',
    instagram: 'https://www.instagram.com/kitexperience',
    location_id: est_coast_location.id,
    user: user3
  },
  {
    name: 'Island Kite School',
    address: 'Tamarin Bay, Mauritius',
    phone: '+230 8765432',
    website: 'http://islandkiteschool.mu',
    email: 'info@islandkiteschool.mu',
    description: 'Expert instruction and rental services in the best location_ids.',
    rental: true,
    levels: 'All levels',
    fee: '65',
    facebook: 'https://www.facebook.com/islandkiteschool',
    instagram: 'https://www.instagram.com/islandkiteschool',
    location_id:  south_location.id,
    user: user4
  },
  {
    name: 'Lagoon Riders',
    address: 'Anse La Raie, Mauritius',
    phone: '+230 1234987',
    website: 'http://lagoonriders.mu',
    email: 'contact@lagoonriders.mu',
    description: 'Great conditions and expert guidance for kite surfers.',
    rental: true,
    levels: 'Beginners to intermediates',
    fee: '60',
    facebook: 'https://www.facebook.com/lagoonriders',
    instagram: 'https://www.instagram.com/lagoonriders',
    location_id: north_location.id,
    user: user1
  }
]

schools.each do |school|
  School.create!(school)
  puts "School #{school[:name]} created ..."
end

puts 'All schools created.'
puts '-------------------------------'

# Shops seeds
puts 'Creating shops...'

shops = [
  {
    name: 'Kite Shop Pro',
    address: 'Grand Baie, Mauritius',
    phone: '+230 1111111',
    website: 'http://kiteshoppro.mu',
    email: 'shop@kiteshoppro.mu',
    description: 'High-quality kitesurfing equipment and accessories.',
    facebook: 'https://www.facebook.com/kiteshoppro',
    instagram: 'https://www.instagram.com/kiteshoppro',
    location_id: north_location.id,
    user: user2
  },
  {
    name: 'Surf & Sail',
    address: 'Black River, Mauritius',
    phone: '+230 2222222',
    website: 'http://surfandsail.mu',
    email: 'info@surfandsail.mu',
    description: 'Your one-stop shop for all surfing and sailing needs.',
    facebook: 'https://www.facebook.com/surfandsail',
    instagram: 'https://www.instagram.com/surfandsail',
    location_id: south_location.id,
    user: user3
  },
  {
    name: 'Wave Supplies',
    address: 'Trou aux Biches, Mauritius',
    phone: '+230 3333333',
    website: 'http://wavesupplies.mu',
    email: 'support@wavesupplies.mu',
    description: 'Find everything you need for water sports in one place.',
    facebook: 'https://www.facebook.com/wavesupplies',
    instagram: 'https://www.instagram.com/wavesupplies',
    location_id: north_location.id,
    user: user4
  },
  {
    name: 'Riders Hub',
    address: 'Port Louis, Mauritius',
    phone: '+230 4444444',
    website: 'http://ridershub.mu',
    email: 'contact@ridershub.mu',
    description: 'Specialized kitesurf shop with all the latest gear.',
    facebook: 'https://www.facebook.com/ridershub',
    instagram: 'https://www.instagram.com/ridershub',
    location_id: north_location.id,
    user: user1
  },
  {
    name: 'The Kiteshop',
    address: 'Flic en Flac, Mauritius',
    phone: '+230 5555555',
    website: 'http://thekiteshop.mu',
    email: 'sales@thekiteshop.mu',
    description: 'Premier destination for top-tier kitesurfing gear.',
    facebook: 'https://www.facebook.com/thekiteshop',
    instagram: 'https://www.instagram.com/thekiteshop',
    location_id: west_coast_location.id,
    user: user2
  }
]

shops.each do |shop|
  Shop.create!(shop)
  puts "Shop #{shop[:name]} created ..."
end

puts 'All shops created.'
puts '-------------------------------'


# Blog seeds
puts 'Starting blog page'
blog1 = BlogPage.create!(
  title: "My first kitesurf experience",
  content: "description of the first experience",
  user: user4
)
blog1.save
puts "Blog #{blog1.title} created ..."

blog2 = BlogPage.create!(
  title: "My second kitesurf experience",
  content: "description of the second experience",
  user: user4
)
blog2.save
puts "Blog #{blog2.title} created ..."

puts 'All blogs created'
puts '-------------------------------'


# # School seeds
# School.create([
#   {
#     name: 'École Primaire Saint-Jean',
#     address: '123 Rue de l\'École, Paris, France',
#     phone: '0102030405',
#     website: 'https://www.ecole-stjean.fr',
#     email: 'contact@ecole-stjean.fr',
#     description: 'Une école primaire avec un excellent programme éducatif.',
#     rental: 'Disponibilité pour location de salles',
#     levels: 'École primaire',
#     fee: 'Gratuit',
#     facebook: 'https://www.facebook.com/ecole.stjean',
#     instagram: 'https://www.instagram.com/ecole.stjean',
#     latitude: 48.8566,
#     longitude: 2.3522,
#     category: 'school',
#     user_id: User.first.id,
#     location_id: Location.first.id
#   },
#   {
#     name: 'École Secondaire Albert Camus',
#     address: '456 Avenue des Champs-Élysées, Paris, France',
#     phone: '0607080901',
#     website: 'https://www.ecole-albertcamus.fr',
#     email: 'info@ecole-albertcamus.fr',
#     description: 'Une école secondaire renommée pour ses activités parascolaires.',
#     rental: 'Salles disponibles',
#     levels: 'École secondaire',
#     fee: '2000€/an',
#     facebook: 'https://www.facebook.com/ecole.albertcamus',
#     instagram: 'https://www.instagram.com/ecole.albertcamus',
#     latitude: 48.8566,
#     longitude: 2.3522,
#     category: 'school',
#     user_id: User.second.id,
#     location_id: Location.second.id
#   }
# ])

# # Shops seed
# Shop.create([
#   {
#     name: 'Boutique Mode Paris',
#     address: '789 Rue de Rivoli, Paris, France',
#     phone: '0123456789',
#     website: 'https://www.boutique-mode-paris.fr',
#     email: 'contact@boutique-mode-paris.fr',
#     description: 'Boutique de vêtements tendance.',
#     facebook: 'https://www.facebook.com/boutique.mode.paris',
#     instagram: 'https://www.instagram.com/boutique.mode.paris',
#     latitude: 48.8566,
#     longitude: 2.3522,
#     category: 'shop',
#     user_id: User.third.id,
#     location_id: Location.third.id
#   },
#   {
#     name: 'Librairie des Champs',
#     address: '101 Boulevard Haussmann, Paris, France',
#     phone: '0145678901',
#     website: 'https://www.librairie-des-champs.fr',
#     email: 'contact@librairie-des-champs.fr',
#     description: 'Librairie spécialisée dans les livres rares.',
#     facebook: 'https://www.facebook.com/librairie.des.champs',
#     instagram: 'https://www.instagram.com/librairie.des.champs',
#     latitude: 48.8566,
#     longitude: 2.3522,
#     category: 'shop',
#     user_id: User.fourth.id,
#     location_id: Location.fourth.id
#   }
# ])
