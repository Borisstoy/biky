# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ model: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Motorbike.destroy_all
User.destroy_all
users = [
  {
    email: "titi@gmail.com",
    password: "654321",
  },
  {
    email: "toto@gmail.com",
    password: "123456",
  }

]
users.each do |u|
  puts "user '#{u[:email]}' created" if User.create!(u)
end

motorbikes = [
  {
    user_id: User.last.id,
    model: "Shiver 750",
    brand: "Aprilia",
    description: "description"
    },
  {
    user_id: User.last.id,
    model: "Dorsoduro 750",
    brand: "Aprilia",
    description: "description"
    },
  {
    user_id: User.last.id,
    model: "SR Max 300 ie",
    brand: "Aprilia",
    description: "description"
    },
  {
    user_id: User.last.id,
    model: "SRV 850 ie",
    brand: "Aprilia",
    description: "description"
    },
  {
    user_id: User.last.id,
    model: "C 650 Sport",
    brand: "BMW",
    description: "description"
    },
  {
    user_id: User.last.id,
    model: " C 650 GT",
    brand: "BMW",
    description: "description"
    },
  {
    user_id: User.last.id,
    model: "F 700 GS ",
    brand: "BMW",
    description: "description"
    },
  {
    user_id: User.last.id,
    model: "F 800 GS",
    brand: "BMW",
    description: "description"
    },
  {
    user_id: User.last.id,
    model: "F 800 GT",
    brand: "BMW",
    description: "description"
    },
  {
    user_id: User.last.id,
    model: "Scrambler 800",
    brand: "Ducati",
    description: "description"
    },
]


motorbikes.each do |m|
  puts "motorbike '#{m[:brand]} #{m[:model]}' created" if Motorbike.create!(m)
end
