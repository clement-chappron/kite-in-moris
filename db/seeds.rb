User.destroy_all
puts 'All users destroyed ...'
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
