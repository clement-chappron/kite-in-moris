require 'open-uri'
require 'cloudinary'
require 'cloudinary/utils'

puts '-------------------------------'
puts 'Destroying all records ...'
puts '-------------------------------'

ReviewSpot.destroy_all
puts 'All review_spots destroyed ...'
ReviewShop.destroy_all
puts 'All review_shops destroyed ...'
School.destroy_all
puts 'All schools destroyed ...'
Shop.destroy_all
puts 'All shops destroyed ...'
BlogPage.destroy_all
puts 'All blogpages destroyed ...'
Spot.destroy_all
puts 'All spots destroyed ...'
User.destroy_all
puts 'All users destroyed ...'
Location.destroy_all
puts 'All locations destroyed ...'
CommentBlog.destroy_all
puts 'All comments on blogpages destroyed ...'
puts '-------------------------------'

# User seeds
user1_img = URI.open('https://res.cloudinary.com/deewxzlno/image/upload/v1724074421/production/avatars/u46sxktotibbrjhhjsym.jpg')
user1 = User.create!(
  first_name: 'Clément',
  last_name: 'Chappron',
  email: 'clement.chappron@gmail.com',
  address: '13D rue des terminalias, Tamarin, Mauritius',
  password: 'password',
  password_confirmation: 'password'
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
  password_confirmation: 'password'
)
user2.profile_picture.attach(io: user2_img, filename: 'user2.jpg', content_type: 'image/jpg')
user2.save
puts "User #{user2.first_name} #{user2.last_name} created ..."

user3_img = URI.open('https://res.cloudinary.com/dfwgh9ry5/image/upload/v1726678411/Avi_wsv3rl.jpg')
user3 = User.create!(
  first_name: 'Avinash',
  last_name: 'Daby',
  email: 'ad@mail.com',
  address: 'Vacoas, Mauritius',
  password: 'password',
  password_confirmation: 'password'
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
  password_confirmation: 'password'
)
user4.profile_picture.attach(io: user4_img, filename: 'user4.jpg', content_type: 'image/jpg')
user4.save
puts "User #{user4.first_name} #{user4.last_name} created ..."

user5_img = URI.open('https://res.cloudinary.com/dfwgh9ry5/image/upload/v1726593709/Aurelia_pcd7xx.jpg')
user5 = User.create!(
  first_name: 'Aurelia',
  last_name: 'Ritter',
  email: 'ar@mail.com',
  address: 'Calodyne, Mauritius',
  password: 'password',
  password_confirmation: 'password'
)
user5.profile_picture.attach(io: user5_img, filename: 'user5.jpg', content_type: 'image/jpg')
user5.save
puts "User #{user5.first_name} #{user5.last_name} created ..."

user6_img = URI.open('https://res.cloudinary.com/dfwgh9ry5/image/upload/v1726640658/Ophelie_cuhaxf.jpg')
user6 = User.create!(
  first_name: 'Ophelie',
  last_name: 'Turenne',
  email: 'ot@mail.com',
  address: 'Beau-Bassin, Mauritius',
  password: 'password',
  password_confirmation: 'password'
)
user6.profile_picture.attach(io: user6_img, filename: 'user6.jpg', content_type: 'image/jpg')
user6.save
puts "User #{user6.first_name} #{user6.last_name} created ..."

user7_img = URI.open('https://res.cloudinary.com/dfwgh9ry5/image/upload/v1726640647/Cedric_ycjlgc.jpg')
user7 = User.create!(
  first_name: 'Cédric',
  last_name: 'Thonney',
  email: 'ct@mail.com',
  address: 'Mahébourg, Mauritius',
  password: 'password',
  password_confirmation: 'password'
)
user7.profile_picture.attach(io: user7_img, filename: 'user7.jpg', content_type: 'image/jpg')
user7.save
puts "User #{user7.first_name} #{user7.last_name} created ..."

user8_img = URI.open('https://res.cloudinary.com/dfwgh9ry5/image/upload/v1726640634/Ajmal_deqeul.jpg')
user8 = User.create!(
  first_name: 'Ajmal',
  last_name: 'Rambocus',
  email: 'ajmal@mail.com',
  address: 'Curepipe, Mauritius',
  password: 'password',
  password_confirmation: 'password'
)
user8.profile_picture.attach(io: user8_img, filename: 'user8.jpg', content_type: 'image/jpg')
user8.save
puts "User #{user8.first_name} #{user8.last_name} created ..."

user9_img = URI.open('https://res.cloudinary.com/dfwgh9ry5/image/upload/v1726640668/Yaasir_vuvah0.jpg')
user9 = User.create!(
  first_name: 'Yaasir',
  last_name: 'Cheekoory',
  email: 'yc@mail.com',
  address: 'Port-Louis, Mauritius',
  password: 'password',
  password_confirmation: 'password'
)
user9.profile_picture.attach(io: user9_img, filename: 'user9.jpg', content_type: 'image/jpg')
user9.save
puts "User #{user9.first_name} #{user9.last_name} created ..."

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

east_coast_location = Location.create!(
  name: "East coast",
  description: "The East Coast is famous for its peaceful beaches and turquoise lagoons. It is a quieter area with opportunities to explore local culture and engage in activities such as kite surfing and snorkeling."
)
east_coast_location.save
puts "Location #{east_coast_location.name} created ..."

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
  description: "Le Morne is one of the most popular kitesurfing spots on the island of Mauritius, offering ideal conditions for both beginners and experts. The site features several kiting zones, ranging from flat water in the lagoon to waves for more experienced riders.",
  level: "All levels",
  location_id: south_location.id,
  wind_conditions: "Constant trade winds ranging from 15 to 25 knots. The optimal period for kitesurfing is between May and November when the winds are strongest and most consistent.",
  safety: "The site is well-supervised with clearly marked swimming zones to ensure the safety of kitesurfers and other beachgoers. Lifeguards are often present during peak hours.",
  amenities: "Nearby, you'll find several beachfront restaurants and bars where you can enjoy local meals and refreshing drinks. Local kitesurfing schools offer lessons and equipment rentals for all levels.",
  accessibility: "Le Morne is easily accessible by car from the capital, Port-Louis, with a drive of about one hour. Various types of accommodation are available in the area, ranging from luxury resorts to more modest guesthouses.",
  points_of_interest: "In addition to kitesurfing, Le Morne offers hiking opportunities on the Morne Brabant mountain, with breathtaking panoramic views of the island and ocean. The area is also rich in culture and history, with several interesting sites to explore.",
  local_culture: "Le Morne is culturally rich, known for its history related to slavery and the maroons. You can learn about this history by visiting local museums and monuments, including the Monument aux Esclaves, dedicated to former slaves and freedmen.",
  water_temperature: "The water is generally warm year-round, with temperatures ranging between 24°C and 30°C, making kitesurfing sessions pleasant even outside the hottest months.",
  best_time_to_visit: "The best time to visit is during the dry season from May to November when wind conditions are most favorable and temperatures are comfortable."
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
  name: "La Pointe d'Esny",
  description: "La Pointe d'Esny is a renowned kitesurfing spot on the southeast coast of Mauritius, famous for its stunning scenery and excellent conditions. The area features a wide lagoon with shallow waters, making it ideal for beginners and intermediate kitesurfers, as well as areas with stronger winds for advanced riders.",
  level: "All levels",
  location_id: south_est_coast_location.id,
  wind_conditions: "La Pointe d'Esny benefits from consistent trade winds ranging from 15 to 20 knots. The best time for kitesurfing is from May to September during the cooler, drier months.",
  safety: "The area is well-managed with designated kitesurfing zones and clear warnings for swimmers. Lifeguards are often present, and the local community is proactive about safety.",
  amenities: "The spot is close to several beachfront hotels and restaurants that offer a variety of dining options. Equipment rentals and lessons are available at local kitesurfing schools.",
  accessibility: "Easily accessible by car from the capital, Port-Louis, with a drive of about 45 minutes. There are various accommodation options nearby, including high-end resorts and budget-friendly lodgings.",
  points_of_interest: "Besides kitesurfing, La Pointe d'Esny is known for its beautiful beaches and proximity to Blue Bay Marine Park, which is perfect for snorkeling and exploring marine life.",
  local_culture: "The region around La Pointe d'Esny is rich in Creole culture. Visitors can enjoy local cuisine and music, and explore nearby villages to experience traditional Mauritian life.",
  water_temperature: "Water temperatures are pleasantly warm throughout the year, ranging from 23°C to 28°C, which makes it comfortable for kitesurfing any time of the year.",
  best_time_to_visit: "The best time to visit is during the winter months from May to September when wind conditions are optimal and the weather is cooler and drier."
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
  description: "Bel Ombre is a picturesque kitesurfing spot located on the southwest coast of Mauritius, known for its expansive lagoon and stunning natural beauty. It offers excellent conditions for all levels of kitesurfers, with a mix of flat water and small waves.",
  level: "All levels",
  location_id: south_location.id,
  wind_conditions: "Bel Ombre experiences consistent trade winds with speeds ranging from 12 to 20 knots. The ideal period for kitesurfing is from May to November when the winds are most reliable.",
  safety: "The area is well-monitored with clear demarcations for kitesurfing and swimming zones. Safety measures are in place, and the presence of lifeguards helps ensure a secure environment for all visitors.",
  amenities: "The nearby resort area offers a range of facilities including restaurants, bars, and shops. Kitesurfing schools in the region provide equipment rentals and lessons for beginners and advanced riders.",
  accessibility: "Bel Ombre is accessible by car from Port-Louis in about an hour and a half. The area is home to several high-end resorts and vacation rentals, catering to various preferences and budgets.",
  points_of_interest: "In addition to kitesurfing, Bel Ombre is renowned for its nature reserves and golf courses. The nearby Bel Ombre Nature Reserve offers opportunities for hiking and wildlife observation.",
  local_culture: "Bel Ombre has a rich history influenced by both Creole and French cultures. Visitors can explore local markets and experience traditional Mauritian cuisine and music.",
  water_temperature: "Water temperatures are comfortably warm year-round, ranging between 24°C and 29°C, making it suitable for kitesurfing throughout the year.",
  best_time_to_visit: "The best time to visit is during the dry season from May to November when wind conditions are optimal and the weather is pleasantly warm and sunny."
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
  description: "Poste Lafayette is a serene kitesurfing destination located on the east coast of Mauritius, known for its calm and inviting waters. The spot offers ideal conditions for both beginners and experienced kitesurfers with a combination of flat water and gentle waves.",
  level: "All levels",
  location_id: east_coast_location.id,
  wind_conditions: "Poste Lafayette benefits from steady trade winds ranging from 10 to 18 knots. The best time for kitesurfing is between June and September when the winds are stronger and more consistent.",
  safety: "The area is generally safe with designated kitesurfing zones and clear separation from swimming areas. The local community is vigilant about safety, and lifeguards are present during peak times.",
  amenities: "There are several local eateries and small shops in the vicinity, offering refreshments and supplies. Kitesurfing schools in the area provide lessons and equipment rentals for all skill levels.",
  accessibility: "Poste Lafayette is accessible by car from Port-Louis in about 45 minutes. Accommodation options are available in the area, including boutique hotels and guesthouses.",
  points_of_interest: "Apart from kitesurfing, Poste Lafayette is known for its tranquil beaches and proximity to natural reserves. Visitors can enjoy relaxing beach walks and explore nearby natural attractions.",
  local_culture: "The region around Poste Lafayette reflects a blend of traditional Mauritian culture with a relaxed beach vibe. Visitors can experience local cuisine and interact with the friendly local community.",
  water_temperature: "The water temperature remains pleasantly warm throughout the year, ranging between 24°C and 27°C, making it ideal for kitesurfing and other water activities.",
  best_time_to_visit: "The best time to visit is from June to September during the cooler, drier months when the wind conditions are most favorable and the weather is pleasant."
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
  name: "Anse La Raie",
  description: "Anse La Raie is a popular kitesurfing spot located on the northern coast of Mauritius. Known for its large lagoon with shallow waters, it provides excellent conditions for beginners and intermediate kitesurfers. The spot also has areas for more advanced riders seeking stronger winds and waves.",
  level: "All levels",
  location_id: north_location.id,
  wind_conditions: "Anse La Raie enjoys consistent trade winds, blowing between 12 to 22 knots, especially strong from June to September, making this period ideal for kitesurfing.",
  safety: "The lagoon is safe for kitesurfing, with a natural reef providing protection from the open sea. Lifeguards are available during peak hours, and designated kitesurfing areas ensure safety for all beachgoers.",
  amenities: "Nearby facilities include local restaurants, bars, and shops where visitors can relax after a kitesurfing session. Kitesurfing schools in the area offer lessons and equipment rentals for all levels.",
  accessibility: "Anse La Raie is easily accessible by car from Grand Baie, with a drive of about 30 minutes. A variety of accommodation options are available, ranging from luxury resorts to smaller guesthouses.",
  points_of_interest: "Aside from kitesurfing, Anse La Raie offers stunning views of the northern islands, and visitors can explore nearby nature reserves or enjoy boat trips to nearby islets.",
  local_culture: "The northern region of Mauritius has a vibrant Creole culture, with opportunities to sample local foods, music, and traditional handicrafts in nearby villages.",
  water_temperature: "The water is warm throughout the year, with temperatures between 24°C and 28°C, making it ideal for water sports at any time of the year.",
  best_time_to_visit: "The best time to visit is from June to September, during the winter months when the winds are strongest and the weather is cool and dry."
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
  description: "Trou d'Eau Douce is a scenic kitesurfing spot located on the east coast of Mauritius. Known for its tranquil lagoon and stunning views of Île aux Cerfs, it offers great conditions for kitesurfers of all levels, especially beginners who appreciate the calm, shallow waters.",
  level: "All levels",
  location_id: east_coast_location.id,
  wind_conditions: "The spot benefits from steady trade winds, ranging from 12 to 18 knots. The best time for kitesurfing is between June and September, during the cooler months when the winds are most consistent.",
  safety: "The lagoon is protected by a coral reef, ensuring calm waters ideal for beginners. There are designated kitesurfing zones, and the area is generally safe for water sports with safety measures in place.",
  amenities: "There are plenty of nearby restaurants, bars, and shops offering refreshments and supplies. Local kitesurfing schools provide lessons and rentals for all levels, making it an accessible spot for visitors.",
  accessibility: "Trou d'Eau Douce is easily accessible by car, approximately an hour's drive from Port-Louis. The area offers various types of accommodation, including luxury resorts and budget-friendly guesthouses.",
  points_of_interest: "Beyond kitesurfing, Trou d'Eau Douce is known for its boat trips to Île aux Cerfs, where visitors can enjoy beaches, golfing, and water sports. The village itself offers a glimpse into traditional Mauritian life.",
  local_culture: "The east coast is rich in Creole heritage, with opportunities to experience local food, music, and traditions in nearby villages. Trou d'Eau Douce has a laid-back, welcoming atmosphere.",
  water_temperature: "The water temperature is warm year-round, ranging between 23°C and 28°C, making it perfect for kitesurfing at any time of the year.",
  best_time_to_visit: "The best time to visit is from June to September, during the dry season when wind conditions are optimal and the weather is pleasantly cool."
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
  description: "La Prairie is a peaceful kitesurfing spot located on the southern coast of Mauritius. With its wide, shallow lagoon and stunning views of Le Morne mountain, it offers excellent conditions for beginners and intermediate kitesurfers. The spot is less crowded than others, providing a more relaxed experience.",
  level: "All levels",
  location_id: south_location.id,
  wind_conditions: "La Prairie enjoys steady winds ranging from 12 to 20 knots, particularly between June and October, making this period ideal for kitesurfing. The winds are more gentle compared to other spots, making it a great choice for learners.",
  safety: "The lagoon is protected by a natural reef, creating calm and shallow waters ideal for beginners. There are designated kitesurfing zones, and safety is ensured through clear guidelines and local supervision.",
  amenities: "There are limited facilities nearby, but local vendors occasionally offer food and refreshments. For kitesurfing lessons or equipment rentals, visitors can head to nearby schools in Le Morne.",
  accessibility: "La Prairie is accessible by car from the capital, with a drive of about 1.5 hours. Accommodation options include nearby resorts and guesthouses, offering various levels of comfort and pricing.",
  points_of_interest: "Aside from kitesurfing, La Prairie is close to nature reserves and hiking trails. The nearby Le Morne mountain offers breathtaking views and rich cultural history.",
  local_culture: "The southern region of Mauritius is deeply connected to the island's history, particularly through the legacy of Le Morne. Visitors can explore local villages to experience traditional Mauritian culture.",
  water_temperature: "Water temperatures at La Prairie are warm throughout the year, ranging from 24°C to 28°C, making it ideal for water sports at any time of the year.",
  best_time_to_visit: "The best time to visit is from June to October, during the dry season when the winds are steady and the weather is mild, providing perfect conditions for kitesurfing."
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
  description: "Palmar is a picturesque kitesurfing spot located on the east coast of Mauritius. Known for its crystal-clear lagoon and gentle winds, it offers great conditions for beginners and intermediate riders. The spot is surrounded by lush greenery and is perfect for those looking for a peaceful kiting experience.",
  level: "All levels",
  location_id: east_coast_location.id,
  wind_conditions: "Palmar experiences consistent trade winds, ranging from 12 to 18 knots. The best kitesurfing conditions are from June to September when the winds are stronger and more predictable.",
  safety: "The shallow lagoon at Palmar is ideal for beginners, with calm waters and designated kitesurfing zones. Safety measures are in place, and the area is generally quiet, making it a safe environment for all.",
  amenities: "There are several resorts, restaurants, and shops nearby, offering a variety of services. Kitesurfing schools are also available for lessons and equipment rentals.",
  accessibility: "Palmar is easily accessible by car, located about an hour's drive from Port-Louis. The area offers a range of accommodation options, from luxury resorts to more affordable guesthouses.",
  points_of_interest: "Beyond kitesurfing, Palmar is close to the famous Belle Mare beach, where visitors can enjoy a range of water sports and activities. The surrounding area is also known for its beautiful hiking trails.",
  local_culture: "The region has a vibrant Creole culture, with local markets and restaurants offering traditional Mauritian cuisine. Visitors can explore nearby villages to experience authentic local life.",
  water_temperature: "The water temperature is warm year-round, ranging from 24°C to 28°C, making it perfect for kitesurfing at any time.",
  best_time_to_visit: "The best time to visit is between June and September, during the cooler months when the winds are optimal and the weather is pleasant."
)
palmar.images.attach(io: palmar_img1, filename: 'palmar1.jpg', content_type: 'image/jpg')
palmar.images.attach(io: palmar_img2, filename: 'palmar2.jpg', content_type: 'image/jpg')
palmar.images.attach(io: palmar_img3, filename: 'palmar3.jpg', content_type: 'image/jpg')
palmar.save
puts "Spot #{palmar.name} created ..."

grand_baie_img3 = URI.open('https://www.mauritius-travel.com/images/og/Landing/grand-baie.jpg')
grand_baie_img1 = URI.open('https://ilemauricehotels.com/data/images/discover-mauritius/kitesurf/mauritius-kitesurfing%20(5).jpg')
grand_baie_img2 = URI.open('https://www.mauritius-travel.com/images/LieuxActivites/galerie/image-843.jpg')

grand_baie = Spot.create!(
  name: "Grand Baie",
  description: "Grand Baie is a lively kitesurfing spot located in the north of Mauritius, known for its beautiful lagoon and vibrant atmosphere. Although the wind is not as strong as in other spots, it is an excellent destination for beginners and those looking to combine kitesurfing with other leisure activities in this popular tourist hub.",
  level: "Beginners to intermediate",
  location_id: north_location.id,
  wind_conditions: "Grand Baie experiences light to moderate winds, generally ranging from 10 to 15 knots. The winds are most consistent from June to September, making this the best time for kitesurfing.",
  safety: "The lagoon is relatively calm and shallow, making it a safe spot for beginners. There are designated areas for water sports, ensuring that kitesurfers, swimmers, and boaters have safe zones to operate in.",
  amenities: "Grand Baie is a bustling area with plenty of amenities, including restaurants, bars, shops, and resorts. Kitesurfing schools are available for lessons and equipment rentals, and visitors can enjoy the area's nightlife after a day on the water.",
  accessibility: "Grand Baie is easily accessible by car, located about 30 minutes from Port-Louis. The area offers a wide range of accommodation options, from budget guesthouses to luxury resorts.",
  points_of_interest: "Besides kitesurfing, Grand Baie is a hub for boat trips, snorkeling, and diving. Visitors can explore the lively village, known for its markets, boutiques, and restaurants, or take trips to nearby islands such as Île aux Cerfs and Coin de Mire.",
  local_culture: "Grand Baie is a melting pot of cultures, with Creole, Indian, and European influences reflected in the local food, music, and festivals. It's a great place to experience the cosmopolitan side of Mauritius.",
  water_temperature: "The water temperature in Grand Baie remains warm year-round, ranging from 24°C to 29°C, making it perfect for water activities.",
  best_time_to_visit: "The best time to visit is between June and September, when the winds are more consistent, and the weather is cooler and drier, providing ideal conditions for kitesurfing and other water sports."
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
  description: "Île aux Cerfs is a stunning kitesurfing spot located just off the east coast of Mauritius. Famous for its turquoise lagoon and sandy beaches, it offers ideal conditions for both beginners and experienced kitesurfers. The spot is surrounded by natural beauty, making it a popular destination for water sports enthusiasts and tourists alike.",
  level: "All levels",
  location_id: east_coast_location.id,
  wind_conditions: "Île aux Cerfs benefits from consistent trade winds, with speeds ranging from 12 to 20 knots. The ideal period for kitesurfing is from June to September when the winds are most reliable.",
  safety: "The lagoon is shallow and protected by coral reefs, providing calm waters for beginners. There are designated kitesurfing areas, ensuring the safety of both kitesurfers and swimmers. Lifeguards are present during peak times.",
  amenities: "As a major tourist destination, Île aux Cerfs is well-equipped with amenities such as restaurants, bars, shops, and water sports facilities. Kitesurfing schools are available for lessons and equipment rentals, catering to all skill levels.",
  accessibility: "Île aux Cerfs is accessible via boat from the mainland, with regular transfers from Trou d'Eau Douce. The island itself has several resorts and day-use facilities, offering a variety of accommodation and services.",
  points_of_interest: "Aside from kitesurfing, Île aux Cerfs is known for its world-class golf course, white sandy beaches, and snorkeling spots. Visitors can also enjoy boat trips and explore the surrounding islets.",
  local_culture: "The island offers a blend of luxury and traditional Mauritian hospitality. Visitors can experience local Creole cuisine at the island's restaurants and enjoy the relaxed island atmosphere.",
  water_temperature: "The water temperature remains warm throughout the year, between 24°C and 28°C, making it perfect for kitesurfing and other water activities at any time of the year.",
  best_time_to_visit: "The best time to visit Île aux Cerfs for kitesurfing is between June and September, during the cooler months when the wind conditions are ideal and the weather is pleasant."
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
  description: "Flic en Flac is a popular beach destination located on the west coast of Mauritius, known for its long stretch of white sandy beaches and clear waters. While not the windiest spot on the island, it offers a pleasant kitesurfing experience, particularly for beginners looking for calm waters in a vibrant setting.",
  level: "Beginners to intermediate",
  location_id: west_coast_location.id,
  wind_conditions: "The winds at Flic en Flac are generally lighter, ranging between 8 to 15 knots. The best time for kitesurfing is during the winter months, from June to September, when the winds are more consistent.",
  safety: "The lagoon is shallow and calm, ideal for beginners. The area is well-patrolled, and designated water sports zones ensure safety for kitesurfers and swimmers alike.",
  amenities: "Flic en Flac is a major tourist area with numerous amenities, including beachfront restaurants, bars, shops, and resorts. Kitesurfing schools are available for lessons and equipment rentals, though the spot is more focused on casual beachgoers.",
  accessibility: "Easily accessible by car, Flic en Flac is located about an hour’s drive from Port-Louis. The area is well-serviced by public transport and offers a wide range of accommodations, from luxury hotels to budget guesthouses.",
  points_of_interest: "Beyond kitesurfing, Flic en Flac offers activities such as snorkeling, scuba diving, and dolphin watching. The nearby Black River Gorges National Park is perfect for nature lovers, offering hiking trails and stunning viewpoints.",
  local_culture: "Flic en Flac is a melting pot of cultures, known for its lively beach atmosphere and vibrant nightlife. Visitors can explore local markets, taste authentic Mauritian cuisine, and enjoy traditional music and festivals.",
  water_temperature: "The water temperature remains warm throughout the year, ranging from 24°C to 28°C, making it ideal for water sports and swimming at any time.",
  best_time_to_visit: "The best time to visit Flic en Flac for kitesurfing is between June and September, when the winds are more reliable and the weather is cooler."
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

#Review_spots
#
# Create 15 reviews for each spot
#
# User seeds
puts 'Creating reviews for spots...'
users = User.all
spots = [le_morne, pointe_desny, bel_ombre, poste_lafayette, anse_la_rae, trou_deau_douce, la_prairie, palmar, grand_baie, ile_aux_cerfs, flic_en_flac]

descriptions = [
  "Amazing spot! The wind conditions were perfect, and the lagoon is simply stunning.",
  "Good for beginners, but can be crowded during peak season. Still a great experience overall.",
  "I had a wonderful time here, though the winds weren't as strong as I'd hoped. The scenery made up for it!",
  "The spot is beautiful but watch out for rocks in some areas. Great for advanced kitesurfers.",
  "Friendly locals and good facilities. I recommend visiting early in the morning to avoid crowds."
]
spots.each do |spot|
  (1..15).each do |i|
    ReviewSpot.create!(
      rating: (i % 5) + 1,
      description: descriptions[i % 5],
      spot_id: spot.id,
      user_id: users[i % users.size].id
    )
  end
  puts "Reviews for #{spot.name} created ..."
end

puts 'All reviews for spots created.'
puts '-------------------------------'



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
    location_id: east_coast_location.id,
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

# Shops for "The North"
Shop.create!(
  name: "North Bay Boutique",
  address: "Coastal Road, Grand Baie, The North, Mauritius",
  phone: "+230 1234561",
  website: "www.northbayboutique.com",
  description: "North Bay Boutique offers an exquisite collection of high-end fashion and accessories tailored for beach lovers. Located in the heart of Grand Baie, the shop provides tourists with everything from summer dresses to stylish beachwear. With a curated selection of local and international brands, North Bay Boutique is the go-to place for fashion-conscious visitors. The shop’s airy design and welcoming atmosphere make for an enjoyable shopping experience near the picturesque beaches of the North.",
  email: "info@northbayboutique.com",
  facebook: "facebook.com/northbayboutique",
  instagram: "instagram.com/northbayboutique",
  location_id: north_location.id,
  user_id: user1.id
)

Shop.create!(
  name: "Lagoon Dive Center",
  address: "Royal Road, Pereybere, The North, Mauritius",
  phone: "+230 1234562",
  website: "www.lagoondivecenter.com",
  description: "Lagoon Dive Center offers thrilling diving experiences for both beginners and experts. Located near Pereybere Beach, the shop provides all necessary equipment and personalized diving courses. Explore the vibrant marine life of Mauritius with certified guides and top-quality gear. Lagoon Dive Center is renowned for its safety standards and expert knowledge of local dive sites. Whether it's your first dive or you're a seasoned diver, this center guarantees a memorable underwater adventure in the crystal-clear waters of the North.",
  email: "info@lagoondivecenter.com",
  facebook: "facebook.com/lagoondivecenter",
  instagram: "instagram.com/lagoondivecenter",
  location_id: north_location.id,
  user_id: user2.id
)

Shop.create!(
  name: "Tropical Treats",
  address: "Sunset Boulevard, Grand Baie, The North, Mauritius",
  phone: "+230 1234563",
  website: "www.tropicaltreats.com",
  description: "Tropical Treats is a delightful bakery and café offering a wide variety of local Mauritian pastries and tropical-flavored desserts. Famous for its artisanal cakes and freshly brewed coffee, it’s the perfect stop for a sweet indulgence after a day on the beach. The café's laid-back vibe and delicious menu make it a favorite among both tourists and locals. Whether you’re in the mood for a light snack or a full dessert experience, Tropical Treats is a must-visit in the North.",
  email: "info@tropicaltreats.com",
  facebook: "facebook.com/tropicaltreats",
  instagram: "instagram.com/tropicaltreats",
  location_id: north_location.id,
  user_id: user3.id
)

Shop.create!(
  name: "Island Souvenirs",
  address: "B13 Road, Mont Choisy, The North, Mauritius",
  phone: "+230 1234564",
  website: "www.islandsouvenirs.com",
  description: "Island Souvenirs is the go-to place for those looking to bring home a piece of Mauritius. Specializing in handcrafted products such as wooden sculptures, jewelry, and paintings, the shop reflects the island's rich cultural heritage. Located near Mont Choisy Beach, it attracts tourists with its wide range of unique items. Visitors can browse through local handicrafts while enjoying the serene surroundings of the North. A perfect spot for finding authentic, locally made gifts and keepsakes.",
  email: "info@islandsouvenirs.com",
  facebook: "facebook.com/islandsouvenirs",
  instagram: "instagram.com/islandsouvenirs",
  location_id: north_location.id,
  user_id: user4.id
)

Shop.create!(
  name: "Sea Breeze Watersports",
  address: "Coastal Road, Cap Malheureux, The North, Mauritius",
  phone: "+230 1234565",
  website: "www.seabreezewatersports.com",
  description: "Sea Breeze Watersports is a leading provider of water-based activities in the North of Mauritius. From jet skiing to parasailing, the shop offers a variety of thrilling experiences for adrenaline junkies. Located in Cap Malheureux, it provides easy access to the vibrant waters of the Indian Ocean. The shop prides itself on safety and fun, making it the perfect spot for both families and solo travelers looking to explore the sea. The stunning coastal views only add to the appeal.",
  email: "info@seabreezewatersports.com",
  facebook: "facebook.com/seabreezewatersports",
  instagram: "instagram.com/seabreezewatersports",
  location_id: north_location.id,
  user_id: user5.id
)

Shop.create!(
  name: "North Wellness Spa",
  address: "Beach Lane, Grand Baie, The North, Mauritius",
  phone: "+230 1234566",
  website: "www.northwellnessspa.com",
  description: "North Wellness Spa is a sanctuary of relaxation and rejuvenation, offering a wide range of spa treatments inspired by Mauritian traditions. From massages to facials, this luxurious spa provides personalized services in a tranquil setting. Located in Grand Baie, it is easily accessible and offers a calming retreat from the bustling beach area. With experienced therapists and high-quality products, North Wellness Spa is the perfect place to unwind after a day of sun and sea.",
  email: "info@northwellnessspa.com",
  facebook: "facebook.com/northwellnessspa",
  instagram: "instagram.com/northwellnessspa",
  location_id: north_location.id,
  user_id: user6.id
)

puts 'All North shops created...'
puts '-------------------------------'

# Shops for "West Coast"
Shop.create!(
  name: "West Coast Surf Shop",
  address: "La Preneuse, Black River, West Coast, Mauritius",
  phone: "+230 1234571",
  website: "www.westcoastsurf.com",
  description: "West Coast Surf Shop is the leading provider of surfboards, wetsuits, and accessories on the West Coast of Mauritius. Located near La Preneuse Beach, the shop caters to both beginners and experienced surfers. With a wide selection of gear from top brands, as well as local advice on the best surf spots, it’s a must-visit for anyone looking to catch some waves. The shop also offers surfboard rentals and repair services for those who prefer not to travel with their own equipment.",
  email: "info@westcoastsurf.com",
  facebook: "facebook.com/westcoastsurf",
  instagram: "instagram.com/westcoastsurf",
  location_id: west_coast_location.id,
  user_id: user7.id
)

Shop.create!(
  name: "West End Café",
  address: "Coastal Road, Flic en Flac, West Coast, Mauritius",
  phone: "+230 1234572",
  website: "www.westendcafe.com",
  description: "West End Café is a lively beachfront café in Flic en Flac, known for its excellent coffee, fresh pastries, and vibrant atmosphere. Whether you're looking for a quick breakfast before heading to the beach or a cozy spot to relax with friends, West End Café offers a diverse menu of local and international flavors. The café is also a great place to enjoy sunsets over the ocean while sipping on tropical smoothies or enjoying a light meal.",
  email: "info@westendcafe.com",
  facebook: "facebook.com/westendcafe",
  instagram: "instagram.com/westendcafe",
  location_id: west_coast_location.id,
  user_id: user8.id
)

Shop.create!(
  name: "Blue Horizon Tours",
  address: "Avenue des Cocotiers, Tamarin, West Coast, Mauritius",
  phone: "+230 1234573",
  website: "www.bluehorizontours.com",
  description: "Blue Horizon Tours offers a wide range of excursions and adventure activities on the West Coast of Mauritius. Whether you're looking to explore the stunning landscapes of Black River Gorges, enjoy a boat trip to the nearby islands, or experience dolphin watching, Blue Horizon Tours has something for every traveler. The team’s expertise and commitment to providing a personalized experience make them one of the top tour operators in the region. Enjoy Mauritius from a new perspective with their carefully curated tours.",
  email: "info@bluehorizontours.com",
  facebook: "facebook.com/bluehorizontours",
  instagram: "instagram.com/bluehorizontours",
  location_id: west_coast_location.id,
  user_id: user9.id
)

Shop.create!(
  name: "West Coast Gallery",
  address: "Royal Road, Black River, West Coast, Mauritius",
  phone: "+230 1234574",
  website: "www.westcoastgallery.com",
  description: "West Coast Gallery is a charming art gallery located in Black River, showcasing the works of talented local artists. The gallery offers a curated selection of paintings, sculptures, and handcrafted items that reflect the beauty of Mauritius. It’s a peaceful place to immerse yourself in the island's artistic culture. Visitors can also purchase original artwork, making it the perfect stop for art lovers or those looking for unique souvenirs to remember their trip to Mauritius.",
  email: "info@westcoastgallery.com",
  facebook: "facebook.com/westcoastgallery",
  instagram: "instagram.com/westcoastgallery",
  location_id: west_coast_location.id,
  user_id: user1.id
)

Shop.create!(
  name: "Lagoon Adventures",
  address: "Beach Road, Flic en Flac, West Coast, Mauritius",
  phone: "+230 1234575",
  website: "www.lagoonadventures.com",
  description: "Lagoon Adventures offers exciting water-based activities on the West Coast, including kayaking, snorkeling, and sunset boat trips. Located in the heart of Flic en Flac, the shop provides easy access to the crystal-clear waters of the lagoon. Whether you’re a family looking for a fun day out on the water or a couple seeking a romantic sunset cruise, Lagoon Adventures has a range of experiences to suit all tastes. The friendly staff ensures a safe and memorable day.",
  email: "info@lagoonadventures.com",
  facebook: "facebook.com/lagoonadventures",
  instagram: "instagram.com/lagoonadventures",
  location_id: west_coast_location.id,
  user_id: user2.id
)

Shop.create!(
  name: "Mauritius Wildlife Centre",
  address: "Main Road, Tamarin, West Coast, Mauritius",
  phone: "+230 1234576",
  website: "www.mauritiuswildlifecentre.com",
  description: "Mauritius Wildlife Centre is dedicated to the conservation of the island's unique wildlife and ecosystems. Located in Tamarin, the centre offers educational tours and interactive experiences for visitors to learn about the native flora and fauna. The shop sells eco-friendly products and souvenirs, with all proceeds supporting wildlife conservation efforts. It's a must-visit for nature lovers and anyone interested in contributing to the preservation of Mauritius' natural beauty. The centre’s efforts focus on creating a sustainable future for local wildlife.",
  email: "info@mauritiuswildlifecentre.com",
  facebook: "facebook.com/mauritiuswildlifecentre",
  instagram: "instagram.com/mauritiuswildlifecentre",
  location_id: west_coast_location.id,
  user_id: user3.id
)

puts 'All West Coast shops created...'
puts '-------------------------------'

# Shops for "East Coast"
Shop.create!(
  name: "East Coast Kiteboarding",
  address: "Palmar Beach, East Coast, Mauritius",
  phone: "+230 1234577",
  website: "www.eastcoastkiteboarding.com",
  description: "East Coast Kiteboarding is the go-to destination for kitesurfing enthusiasts. Nestled along the stunning beaches of Palmar, this shop offers everything from high-quality kites and boards to lessons for beginners. With experienced instructors and a vibrant community, East Coast Kiteboarding ensures you have a memorable experience while mastering the art of kitesurfing. The shop also provides equipment rentals and repair services, making it an essential stop for anyone looking to ride the waves in one of the best spots in Mauritius.",
  email: "info@eastcoastkiteboarding.com",
  facebook: "facebook.com/eastcoastkiteboarding",
  instagram: "instagram.com/eastcoastkiteboarding",
  location_id: east_coast_location.id,
  user_id: user4.id
)

Shop.create!(
  name: "Tropical Paradise Restaurant",
  address: "Grand River South East, East Coast, Mauritius",
  phone: "+230 1234578",
  website: "www.tropicalparadiserestaurant.com",
  description: "Tropical Paradise Restaurant is a charming beachfront eatery located along the East Coast, known for its delicious seafood and stunning views of the lagoon. Guests can enjoy fresh fish dishes, tropical salads, and local delicacies while relaxing in a vibrant atmosphere. The restaurant is perfect for families and couples alike, offering both indoor and outdoor seating. With a focus on using fresh, local ingredients, Tropical Paradise ensures a delightful dining experience that highlights the flavors of Mauritius.",
  email: "info@tropicalparadiserestaurant.com",
  facebook: "facebook.com/tropicalparadiserestaurant",
  instagram: "instagram.com/tropicalparadiserestaurant",
  location_id: east_coast_location.id,
  user_id: user5.id
)

Shop.create!(
  name: "East Coast Adventures",
  address: "Belle Mare, East Coast, Mauritius",
  phone: "+230 1234579",
  website: "www.eastcoastadventures.com",
  description: "East Coast Adventures specializes in outdoor activities and excursions tailored to nature lovers and adventure seekers. Located in Belle Mare, the shop offers a range of activities including snorkeling, hiking, and guided nature tours. Visitors can explore the lush surroundings and discover the island's diverse flora and fauna while enjoying personalized service from the friendly staff. Whether you're a thrill-seeker or someone looking to relax in nature, East Coast Adventures has something for everyone to enjoy.",
  email: "info@eastcoastadventures.com",
  facebook: "facebook.com/eastcoastadventures",
  instagram: "instagram.com/eastcoastadventures",
  location_id: east_coast_location.id,
  user_id: user6.id
)

Shop.create!(
  name: "Coral Reef Boutique",
  address: "Trou d'Eau Douce, East Coast, Mauritius",
  phone: "+230 1234580",
  website: "www.coralreefboutique.com",
  description: "Coral Reef Boutique is a delightful shop that specializes in unique clothing, accessories, and souvenirs inspired by the beauty of the East Coast. Located in Trou d'Eau Douce, the boutique showcases local artisans' work and offers a range of products, from beachwear to handcrafted jewelry. The friendly staff is always ready to help customers find the perfect gift or memento to remember their trip. It’s a great place to shop for something special that reflects the spirit of Mauritius.",
  email: "info@coralreefboutique.com",
  facebook: "facebook.com/coralreefboutique",
  instagram: "instagram.com/coralreefboutique",
  location_id: east_coast_location.id,
  user_id: user1.id
)

Shop.create!(
  name: "East Coast Eco Tours",
  address: "Ile aux Cerfs, East Coast, Mauritius",
  phone: "+230 1234581",
  website: "www.eastcoastecotours.com",
  description: "East Coast Eco Tours is committed to providing eco-friendly experiences that highlight the natural beauty of Mauritius. Offering guided tours to the stunning Ile aux Cerfs, visitors can enjoy activities such as snorkeling, kayaking, and nature walks while learning about the local ecosystem. The team prioritizes sustainability and ensures that all tours minimize their environmental impact, making it a perfect choice for conscious travelers who want to explore while preserving the island's beauty.",
  email: "info@eastcoastecotours.com",
  facebook: "facebook.com/eastcoastecotours",
  instagram: "instagram.com/eastcoastecotours",
  location_id: east_coast_location.id,
  user_id: user2.id
)

Shop.create!(
  name: "Island Souvenirs",
  address: "Quatre Soeurs, East Coast, Mauritius",
  phone: "+230 1234582",
  website: "www.islandsouvenirs.com",
  description: "Island Souvenirs is the perfect place to find unique gifts and keepsakes that capture the essence of Mauritius. Located in Quatre Soeurs, the shop offers a variety of handcrafted items, local art, and traditional crafts that reflect the island's rich culture. Visitors can browse through an array of products, from spices to textiles, making it an ideal stop for anyone looking to take a piece of Mauritius home. The friendly staff is eager to assist you in finding the perfect memento.",
  email: "info@islandsouvenirs.com",
  facebook: "facebook.com/islandsouvenirs",
  instagram: "instagram.com/islandsouvenirs",
  location_id: east_coast_location.id,
  user_id: user3.id
)

puts 'All East Coast shops created...'
puts '-------------------------------'


# Shops for "South East Coast"
Shop.create!(
  name: "South East Water Sports",
  address: "Anahita, South East Coast, Mauritius",
  phone: "+230 1234583",
  website: "www.southeastwatersports.com",
  description: "South East Water Sports is a premier destination for water sports enthusiasts looking to experience the beauty of the South East Coast. Located in Anahita, this shop offers a wide range of activities including jet skiing, paddleboarding, and kite surfing. With experienced instructors and top-notch equipment, visitors can explore the stunning lagoons and enjoy thrilling adventures. Whether you're a beginner or an experienced rider, South East Water Sports ensures an unforgettable experience in one of Mauritius's most beautiful settings.",
  email: "info@southeastwatersports.com",
  facebook: "facebook.com/southeastwatersports",
  instagram: "instagram.com/southeastwatersports",
  location_id: south_est_coast_location.id,
  user_id: user4.id
)

Shop.create!(
  name: "La Belle Vie Restaurant",
  address: "Bel Ombre, South East Coast, Mauritius",
  phone: "+230 1234584",
  website: "www.labellevierestaurant.com",
  description: "La Belle Vie Restaurant is a hidden gem nestled along the picturesque South East Coast, known for its exquisite cuisine and breathtaking ocean views. Guests can indulge in a variety of gourmet dishes featuring fresh, locally sourced ingredients. The restaurant offers a romantic ambiance with outdoor seating that allows diners to soak in the beautiful surroundings while enjoying their meals. Whether you're looking for a casual lunch or a fine dining experience, La Belle Vie promises a delightful culinary journey.",
  email: "info@labellevierestaurant.com",
  facebook: "facebook.com/labellevierestaurant",
  instagram: "instagram.com/labellevierestaurant",
  location_id: south_est_coast_location.id,
  user_id: user5.id
)

Shop.create!(
  name: "South East Safari Tours",
  address: "Vieux Grand Port, South East Coast, Mauritius",
  phone: "+230 1234585",
  website: "www.southeastsafaritours.com",
  description: "South East Safari Tours specializes in unforgettable excursions that allow visitors to explore the stunning landscapes and wildlife of the South East Coast. Offering guided tours that include visits to nature reserves, cultural sites, and scenic viewpoints, the team ensures a personalized experience tailored to each guest's interests. Travelers can immerse themselves in the beauty of Mauritius while learning about its unique history and biodiversity. South East Safari Tours is the ideal choice for adventure seekers and nature lovers alike.",
  email: "info@southeastsafaritours.com",
  facebook: "facebook.com/southeastsafaritours",
  instagram: "instagram.com/southeastsafaritours",
  location_id: south_est_coast_location.id,
  user_id: user6.id
)

Shop.create!(
  name: "Coral Bay Boutique",
  address: "Souillac, South East Coast, Mauritius",
  phone: "+230 1234586",
  website: "www.coralbayboutique.com",
  description: "Coral Bay Boutique is a charming shop that offers a variety of unique clothing, accessories, and handcrafted souvenirs inspired by the stunning coastal landscape. Located in Souillac, the boutique showcases local artisans' creations, making it a perfect stop for visitors looking to bring home a piece of Mauritian culture. From beachwear to beautiful crafts, Coral Bay Boutique is dedicated to providing quality products that reflect the island's vibrant spirit. The friendly staff is always on hand to assist customers in finding the perfect item.",
  email: "info@coralbayboutique.com",
  facebook: "facebook.com/coralbayboutique",
  instagram: "instagram.com/coralbayboutique",
  location_id: south_est_coast_location.id,
  user_id: user1.id
)

Shop.create!(
  name: "Adventure Isle Tours",
  address: "Ile aux Cerfs, South East Coast, Mauritius",
  phone: "+230 1234587",
  website: "www.adventureisletours.com",
  description: "Adventure Isle Tours offers exciting excursions to the stunning Ile aux Cerfs, where visitors can enjoy a day of relaxation and adventure. From boat trips to snorkeling and beach games, Adventure Isle ensures that every guest experiences the beauty and fun that the island has to offer. With knowledgeable guides who provide insights into the local ecology and culture, guests can explore both the natural beauty and historical significance of this magnificent destination. Adventure Isle Tours is perfect for families, couples, and solo travelers alike.",
  email: "info@adventureisletours.com",
  facebook: "facebook.com/adventureisletours",
  instagram: "instagram.com/adventureisletours",
  location_id: south_est_coast_location.id,
  user_id: user2.id
)

Shop.create!(
  name: "South East Gifts",
  address: "Rose Belle, South East Coast, Mauritius",
  phone: "+230 1234588",
  website: "www.southeastgifts.com",
  description: "South East Gifts is the perfect shop to find authentic Mauritian souvenirs and gifts that showcase the island's rich culture. Located in Rose Belle, the shop offers a wide range of products, including traditional crafts, spices, and artwork made by local artisans. Whether you're looking for the perfect gift for a loved one or a keepsake to remember your trip, South East Gifts has something special for everyone. The friendly atmosphere and knowledgeable staff will help you find exactly what you need.",
  email: "info@southeastgifts.com",
  facebook: "facebook.com/southeastgifts",
  instagram: "instagram.com/southeastgifts",
  location_id: south_est_coast_location.id,
  user_id: user3.id
)

puts 'All South East Coast shops created...'
puts '-------------------------------'

# Shops for "The South"
Shop.create!(
  name: "South Adventure Tours",
  address: "Bel Ombre, South, Mauritius",
  phone: "+230 1234590",
  website: "www.southadventuretours.com",
  description: "South Adventure Tours offers exhilarating excursions that allow visitors to discover the breathtaking landscapes and diverse wildlife of the South of Mauritius. From guided hikes to waterfalls and gorges to boat trips in pristine lagoons, this tour operator tailors experiences to match every adventurer's desires. Knowledgeable guides share insights into the local flora and fauna, ensuring guests leave with unforgettable memories and a deeper appreciation of this stunning region. Perfect for families, couples, and solo explorers, South Adventure Tours promises an adventure like no other.",
  email: "info@southadventuretours.com",
  facebook: "facebook.com/southadventuretours",
  instagram: "instagram.com/southadventuretours",
  location_id: south_location.id,
  user_id: user4.id
)

Shop.create!(
  name: "The Beach House Restaurant",
  address: "Souillac, South, Mauritius",
  phone: "+230 1234591",
  website: "www.thebeachhouserestaurant.com",
  description: "The Beach House Restaurant is a beautiful seaside dining destination that offers a delectable selection of fresh seafood and local delicacies. With its stunning ocean views and relaxing ambiance, it’s the perfect spot to unwind after a day of exploring the South. The menu features seasonal ingredients and dishes inspired by traditional Mauritian cuisine. Guests can enjoy both indoor and outdoor seating while savoring the delightful flavors of the island. The friendly staff ensures a warm and welcoming experience for all diners.",
  email: "info@thebeachhouserestaurant.com",
  facebook: "facebook.com/thebeachhouserestaurant",
  instagram: "instagram.com/thebeachhouserestaurant",
  location_id: south_location.id,
  user_id: user5.id
)

Shop.create!(
  name: "Island Explorers Kayaking",
  address: "Bel Ombre, South, Mauritius",
  phone: "+230 1234592",
  website: "www.islandexplorerskayaking.com",
  description: "Island Explorers Kayaking provides exciting kayaking adventures in the beautiful waters off the South coast of Mauritius. This shop offers rental services and guided tours that allow participants to explore hidden coves and observe marine life in their natural habitat. With qualified instructors on hand, visitors can enjoy a safe and memorable experience, whether they're seasoned paddlers or first-timers. Kayaking through the stunning lagoons is a fantastic way to discover the beauty of the island's coastline and get up close with nature.",
  email: "info@islandexplorerskayaking.com",
  facebook: "facebook.com/islandexplorerskayaking",
  instagram: "instagram.com/islandexplorerskayaking",
  location_id: south_location.id,
  user_id: user6.id
)

Shop.create!(
  name: "Coconut Grove Spa",
  address: "Le Morne, South, Mauritius",
  phone: "+230 1234593",
  website: "www.coconutgrovespa.com",
  description: "Coconut Grove Spa is a tranquil oasis offering a range of wellness treatments designed to rejuvenate the mind, body, and spirit. Nestled in the lush surroundings of Le Morne, the spa features professional therapists who specialize in traditional and modern massage techniques, facials, and holistic treatments. Guests can enjoy a serene atmosphere while indulging in spa packages that provide relaxation and tranquility. It’s the ideal place to unwind after exploring the natural beauty of the South of Mauritius.",
  email: "info@coconutgrovespa.com",
  facebook: "facebook.com/coconutgrovespa",
  instagram: "instagram.com/coconutgrovespa",
  location_id: south_location.id,
  user_id: user1.id
)

Shop.create!(
  name: "Le Morne Boutique",
  address: "Le Morne, South, Mauritius",
  phone: "+230 1234594",
  website: "www.lemorneboutique.com",
  description: "Le Morne Boutique is a delightful shop that offers an array of unique souvenirs, beachwear, and handcrafted items inspired by the island’s rich culture and natural beauty. Located in the iconic area of Le Morne, the boutique showcases the work of local artisans, allowing visitors to take home a piece of Mauritius. From clothing and accessories to artwork and crafts, Le Morne Boutique is dedicated to providing quality products that reflect the vibrant spirit of the island. The friendly staff is eager to assist customers in finding the perfect memento.",
  email: "info@lemorneboutique.com",
  facebook: "facebook.com/lemorneboutique",
  instagram: "instagram.com/lemorneboutique",
  location_id: south_location.id,
  user_id: user2.id
)

Shop.create!(
  name: "South Lagoon Diving Center",
  address: "Bel Ombre, South, Mauritius",
  phone: "+230 1234595",
  website: "www.southlagoondiving.com",
  description: "South Lagoon Diving Center is the ultimate destination for diving enthusiasts eager to explore the underwater wonders of the South coast. The center offers PADI-certified courses for divers of all levels and organizes guided dives to stunning coral reefs, shipwrecks, and marine parks. With a focus on safety and fun, South Lagoon Diving Center provides high-quality equipment and experienced instructors to ensure an unforgettable diving experience. Discover the vibrant marine life and beautiful underwater landscapes that make Mauritius a top diving destination.",
  email: "info@southlagoondiving.com",
  facebook: "facebook.com/southlagoondiving",
  instagram: "instagram.com/southlagoondiving",
  location_id: south_location.id,
  user_id: user3.id
)

puts 'All South shops created...'
puts '-------------------------------'

# images des shops

def fetch_public_ids_from_cloudinary
  public_ids = []
  next_cursor = nil

  begin
    response = Cloudinary::Api.resources(type: 'upload', prefix: 'Kite_in_moris/Shops', max_results: 100, next_cursor: next_cursor)
    # Ajouter les public_ids récupérés à la liste
    public_ids.concat(response['resources'].map { |resource| resource['public_id'] })
    # Vérifier s'il y a une page suivante
    next_cursor = response['next_cursor']
  end while next_cursor
  public_ids
end


public_ids = fetch_public_ids_from_cloudinary

if public_ids.any?
  Shop.all.each do |shop|
    selected_images = public_ids.sample(8)
    selected_images.each do |public_id|
      image_url = Cloudinary::Utils.cloudinary_url(public_id)
      shop.images.attach(io: URI.open(image_url), filename: "#{public_id}.jpg")
      puts "Image attached to #{shop.name}"
    end
  end
else
  puts "No image in the Cloudinary folder."
end
puts 'All images are upload'
puts '-------------------------------'

puts 'All shops created.'
puts '-------------------------------'

puts 'Creating Reviews for Shops...'

shops = Shop.all

shops.each do |shop|
  User.all.each do |user|

    description = case user.email
                  when 'clement.chappron@gmail.com' then "Great selection of gear at #{shop.name}!"
                  when 'ed@mail.com' then "Excellent customer service at #{shop.name}."
                  when 'ad@mail.com' then "Loved the vibe at #{shop.name}."
                  when 'ls@mail.com' then "Best prices I found for kitesurfing equipment at #{shop.name}."
                  when 'ar@mail.com' then "Highly recommend #{shop.name} for beginners."
                  when 'ot@mail.com' then "Great location for #{shop.name}."
                  when 'ct@mail.com' then "Friendly staff at #{shop.name}."
                  when 'ajmal@mail.com' then "Good variety of brands at #{shop.name}."
                  when 'yc@mail.com' then "Overall, a great experience at #{shop.name}."
                  end

    ReviewShop.create(
      rating: rand(3..5),
      description: description,
      user: user,
      shop: shop
    )
  end
end

puts 'All reviews for shops created.'
puts '-------------------------------'

# Blog seeds

puts 'Starting blog page'
img_blog_1 = URI.open('https://sportihome.com/uploads/spots/587e6f0ebcc3d4e1419df327/large/IMG_4667.jpg')
img_blog_2 = URI.open('https://i0.wp.com/isabellefabre.fr/wp-content/uploads/DJI_0566.jpg?resize=1170%2C780&ssl=1')
img_blog_3 = URI.open('https://fun-and-fly.com/wp-content/uploads/pgi/brut/card_jpg/SPOT__LOCATION_DOC_427.jpg')
img_blog_4 = URI.open('https://spots-evasion.com/wp-content/uploads/2022/05/sejour-kite-C-Mauritius-4.jpg')
img_blog_5 = URI.open('https://fun-and-fly.com/wp-content/uploads/pgi/brut/SPOT__LOCATION_DOC_821.jpg')


blog1 = BlogPage.create!(
  title: "My first kitesurf experience",
  content: "<h2>Introduction to Kitesurfing in Mauritius</h2>
            <p>Discovering kitesurfing in Mauritius was a life-changing experience. The island’s pristine beaches and perfect wind conditions make it ideal for beginners and pros alike.</p>
            <h3>Why Mauritius is Perfect for Kitesurfing</h3>
            <p>With steady winds and crystal-clear lagoons, Mauritius offers a unique blend of conditions that are suitable for all levels.</p>
            <h3>The Best Spots for Beginners</h3>
            <p>Le Morne and Belle Mare are among the most beginner-friendly spots, offering shallow waters and steady winds.</p>
            <h2>Getting Started: Gear and Techniques</h2>
            <h3>Essential Gear for Kitesurfing</h3>
            <p>Choosing the right gear is crucial. You’ll need a kite, board, harness, and safety equipment.</p>
            <h3>Basic Techniques to Master</h3>
            <p>Learning to control the kite and balance on the board are fundamental skills. Taking a lesson from a local school is highly recommended.</p>
            <h2>My Experience at Le Morne</h2>
            <h3>The Learning Curve</h3>
            <p>While the first few attempts were challenging, the feeling of gliding over the water was exhilarating.</p>
            <h3>What I Learned</h3>
            <p>Patience and practice are key. After a few days, I was able to stay on the board and ride small waves.</p>",
  user: user2
)
blog1.blog_picture.attach(io: img_blog_1, filename: 'img_blog_1.jpg', content_type: 'image/jpg')
blog1.save
puts "Blog #{blog1.title} created ..."



blog2 = BlogPage.create!(
  title: "The Ultimate Kite Gear Comparison: North vs Duotone",
  content: "<h2>Kitesurf Gear Overview</h2>
            <p>When choosing kitesurfing gear, two popular brands stand out: North and Duotone. But which one is better for your needs?</p>
            <h3>Durability and Build Quality</h3>
            <p>Both brands offer high-quality materials, but Duotone kites tend to last longer due to reinforced stitching.</p>
            <h3>Performance in Different Wind Conditions</h3>
            <p>North kites are known for their power in low-wind conditions, while Duotone kites excel in high-wind scenarios.</p>
            <h2>Board Comparison: Which One Rides Better?</h2>
            <h3>Flex and Responsiveness</h3>
            <p>North boards are slightly stiffer, offering more control for advanced riders. Duotone boards, on the other hand, provide more flexibility, making them ideal for freestyle.</p>
            <h3>Comfort and Stability</h3>
            <p>Duotone boards are praised for their comfortable foot straps and stability in choppy waters, while North offers more aggressive handling.</p>
            <h2>Harnesses and Safety Gear</h2>
            <h3>Comfort and Fit</h3>
            <p>Both brands offer ergonomic harnesses, but Duotone's waist harnesses are considered more comfortable for longer sessions.</p>
            <h3>Safety Features</h3>
            <p>North and Duotone both offer reliable quick-release systems, though North’s safety mechanisms are more user-friendly for beginners.</p>",
  user: user1
)
blog2.blog_picture.attach(io: img_blog_2, filename: 'img_blog_2.jpg', content_type: 'image/jpg')
blog2.save
puts "Blog #{blog2.title} created ..."

puts 'Starting blog page'
blog3 = BlogPage.create!(
  title: "My Top 3 Kitesurfing Spots in Mauritius",
  content: "<h2>Le Morne: A Paradise for Kitesurfers</h2>
            <h3>Why Le Morne is Perfect for All Levels</h3>
            <p>Le Morne offers a variety of conditions, from shallow lagoons for beginners to powerful waves for pros.</p>
            <h3>Best Time to Visit Le Morne</h3>
            <p>The ideal months for kitesurfing here are from June to October when the trade winds are strongest.</p>
            <h2>Belle Mare: A Hidden Gem for Freestyle</h2>
            <h3>Freestyle Opportunities</h3>
            <p>Belle Mare’s flat water makes it perfect for practicing freestyle tricks.</p>
            <h3>What Makes Belle Mare Special</h3>
            <p>This spot is less crowded, providing ample space for kitesurfers to practice without interference.</p>
            <h2>Anse La Raie: A Beginner’s Dream</h2>
            <h3>Calm Waters for Learning</h3>
            <p>Anse La Raie is known for its flat, shallow waters, ideal for those who are just starting out.</p>
            <h3>Kite Schools in Anse La Raie</h3>
            <p>Several kitesurfing schools offer lessons and rentals, making it convenient for beginners to get started.</p>",
  user: user5
)
blog3.blog_picture.attach(io: img_blog_3, filename: 'img_blog_3.jpg', content_type: 'image/jpg')
blog3.save
puts "Blog #{blog3.title} created ..."

puts 'Starting blog page'
blog4 = BlogPage.create!(
  title: "How to Perform Your First Kitesurf Jump",
  content: "<h2>Understanding the Basics of Jumping</h2>
            <h3>Timing and Wind Conditions</h3>
            <p>Mastering the timing of your jump is crucial. You’ll need to catch the wind at the right moment for lift.</p>
            <h3>Kite Positioning</h3>
            <p>Your kite should be at a 45-degree angle when you're ready to jump, providing the perfect balance between lift and control.</p>
            <h2>Step-by-Step Jump Guide</h2>
            <h3>Step 1: Build Up Speed</h3>
            <p>Before jumping, ride upwind to build momentum. Speed is essential for a successful jump.</p>
            <h3>Step 2: Pull the Bar In</h3>
            <p>As you prepare to jump, pull in on the bar to generate lift.</p>
            <h3>Step 3: Launch into the Air</h3>
            <p>Push the board down, and use your legs to propel yourself into the air while keeping the kite stable.</p>
            <h2>Landing Safely</h2>
            <h3>Control Your Descent</h3>
            <p>As you descend, slowly steer the kite back to the 12 o’clock position to soften your landing.</p>
            <h3>Keep Your Knees Bent</h3>
            <p>Bend your knees upon landing to absorb the impact and regain control of your board.</p>",
  user: user4
)
blog4.blog_picture.attach(io: img_blog_4, filename: 'img_blog_4.jpg', content_type: 'image/jpg')
blog4.save
puts "Blog #{blog4.title} created ..."

puts 'Starting blog page'
blog5 = BlogPage.create!(
  title: "The Evolution of Kitesurfing Gear: What’s New in 2024?",
  content: "<h2>New Kite Designs for Better Performance</h2>
            <h3>Lighter Materials</h3>
            <p>The latest kites feature lighter materials, making them easier to control and more responsive.</p>
            <h3>Improved Aerodynamics</h3>
            <p>Design improvements have led to more aerodynamic kites, which reduce drag and enhance speed.</p>
            <h2>Boards with Advanced Flex Technology</h2>
            <h3>Enhanced Durability</h3>
            <p>New boards are built with stronger materials, offering increased durability without compromising on flexibility.</p>
            <h3>Better Shock Absorption</h3>
            <p>Advanced shock-absorption technology helps riders maintain control in choppy waters.</p>
            <h2>Safety Features: What’s Improved?</h2>
            <h3>Enhanced Quick-Release Systems</h3>
            <p>2024 sees the introduction of faster, more intuitive quick-release mechanisms for increased safety.</p>
            <h3>Smarter Harness Designs</h3>
            <p>New harnesses provide better lumbar support, reducing strain during long sessions.</p>",
  user: user3
)
blog5.blog_picture.attach(io: img_blog_5, filename: 'img_blog_5.jpg', content_type: 'image/jpg')
blog5.save
puts "Blog #{blog5.title} created ..."

puts 'All blog pages created.'

puts 'Creating blog pages comments'
CommentBlog.create(
  description: "I am amazed. Mauritius sounds too good to be true.",
  user: user1,
  blog_page: blog1
)
CommentBlog.create(
  description: "This is my first blog post. Thank you for your comments!",
  user: user2,
  blog_page: blog1
)
CommentBlog.create(
  description: "This blog post is very informative. I learned a lot from it.",
  user: user3,
  blog_page: blog1
)
CommentBlog.create(
  description: "I do not agree with your view. Can we discuss it?",
  user: user4,
  blog_page: blog1
)
CommentBlog.create(
  description: "This is a great read. Very vivid experience!",
  user: user5,
  blog_page: blog1
)
CommentBlog.create(
  description: "Sounds amazing! I guess I must try too!",
  user: user6,
  blog_page: blog1
)
CommentBlog.create(
  description: "I feel motivated by your experience!",
  user: user7,
  blog_page: blog1
)
CommentBlog.create(
  description: "Wow you sure had a great time!",
  user: user8,
  blog_page: blog1
)
CommentBlog.create(
  description: "Nice post! Keep updating us!",
  user: user9,
  blog_page: blog1
)

puts "Comments for #{blog1.title} created ..."

CommentBlog.create(
  description: "Waiting to hear your comments!",
  user: user1,
  blog_page: blog2
)
CommentBlog.create(
  description: "You sure gave a good analysis of the gears! Keep writing about your experiences!",
  user: user2,
  blog_page: blog2
)
CommentBlog.create(
  description: "Wonderful! It makes me want to try it too!",
  user: user3,
  blog_page: blog2
)
CommentBlog.create(
  description: "Please contact me. i would like to know more about Duotone.",
  user: user4,
  blog_page: blog2
)
CommentBlog.create(
  description: "Great comparison made!",
  user: user5,
  blog_page: blog2
)
CommentBlog.create(
  description: "Would you mind giving me some advices on how to start kitesurfing?",
  user: user6,
  blog_page: blog2
)
CommentBlog.create(
  description: "Nice analysis. What are the prices involved?",
  user: user7,
  blog_page: blog2
)
CommentBlog.create(
  description: "I prefer North ones!",
  user: user8,
  blog_page: blog2
)
CommentBlog.create(
  description: "You have good writing skills!",
  user: user9,
  blog_page: blog2
)

puts "Comments for #{blog2.title} created ..."

CommentBlog.create(
  description: "I love Le Morne!",
  user: user1,
  blog_page: blog3
)
CommentBlog.create(
  description: "You sure had fun in those spots! Keep writing about your experiences!",
  user: user2,
  blog_page: blog3
)
CommentBlog.create(
  description: "Wonderful! It makes me want to try these spots too!",
  user: user3,
  blog_page: blog3
)
CommentBlog.create(
  description: "What other interesting spots can we find?",
  user: user4,
  blog_page: blog3
)
CommentBlog.create(
  description: "I like Anse La Raie!",
  user: user5,
  blog_page: blog3
)
CommentBlog.create(
  description: "Belle Mare is so nice!",
  user: user6,
  blog_page: blog3
)
CommentBlog.create(
  description: "How would you compare these spots to the best spots in the world?",
  user: user7,
  blog_page: blog3
)
CommentBlog.create(
  description: "I've been to these spots and I love them all!",
  user: user8,
  blog_page: blog3
)
CommentBlog.create(
  description: "Hey pal! Just wanted to give a thumbs up and encourage you in your endeavours!",
  user: user9,
  blog_page: blog3
)

puts "Comments for #{blog3.title} created ..."

CommentBlog.create(
  description: "Important tips to follow!",
  user: user1,
  blog_page: blog4
)
CommentBlog.create(
  description: "Mmm...but these are really the basics...",
  user: user2,
  blog_page: blog4
)
CommentBlog.create(
  description: "It sounds complicated to me!",
  user: user3,
  blog_page: blog4
)
CommentBlog.create(
  description: "These are essential advices! Beginners should really understand these!",
  user: user4,
  blog_page: blog4
)
CommentBlog.create(
  description: "Hi! How are you doing? Your website looks great!",
  user: user5,
  blog_page: blog4
)
CommentBlog.create(
  description: "What are the best schools on the island?",
  user: user6,
  blog_page: blog4
)
CommentBlog.create(
  description: "I am always afraid at the moment of landing. Hope your tips will help me!",
  user: user7,
  blog_page: blog4
)
CommentBlog.create(
  description: "Do you have links to some good youtube videos for these tips?",
  user: user8,
  blog_page: blog4
)
CommentBlog.create(
  description: "I came across your blog page recently and I must say it is very useful!",
  user: user9,
  blog_page: blog4
)

puts "Comments for #{blog4.title} created ..."

CommentBlog.create(
  description: "Talk a little more about enhanced durability. What materials are being used?",
  user: user1,
  blog_page: blog5
)
CommentBlog.create(
  description: "Oh my! This is really a very dynamic field!",
  user: user2,
  blog_page: blog5
)
CommentBlog.create(
  description: "A succinct account of developments in the field of kitesurfing! Stay connected for more updates!",
  user: user3,
  blog_page: blog5
)
CommentBlog.create(
  description: "The advances in aerodynamics are simply astonishing!",
  user: user4,
  blog_page: blog5
)
CommentBlog.create(
  description: "What about prices involved in this activity? Are they going down in 2024?",
  user: user5,
  blog_page: blog5
)
CommentBlog.create(
  description: "Hey could you tell us a little more about safety issues?",
  user: user6,
  blog_page: blog5
)
CommentBlog.create(
  description: "Brief but very interesting account of evolution in the sector!",
  user: user7,
  blog_page: blog5
)
CommentBlog.create(
  description: "I have a youtube channel dealing on kitesurfing where I give tips and advices. Please do check it out!",
  user: user8,
  blog_page: blog5
)
CommentBlog.create(
  description: "Good work!",
  user: user9,
  blog_page: blog5
)

puts "Comments for #{blog5.title} created ..."
puts 'All comments on blog pages created'
puts '-------------------------------'
