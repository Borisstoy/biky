# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ model: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "sprockets/railtie"
require "attachinary/orm/active_record"

Motorbike.destroy_all
User.destroy_all
users = [
  {
    email: "carl@biky.com",
    password: "123456",
    first_name: "carl"
  },
  {
    email: "jordan@biky.com",
    password: "123456",
    first_name: "jordan"
  },
  {
    email: "boris@biky.com",
    password: "123456",
    first_name: "boris"
  },
  {
    email: "jc@biky.com",
    password: "123456",
    first_name: "jc"
  }

]
users.each do |u|
  puts "user '#{u[:email]}' created" if User.create!(u)
end


motorbikes = [
  {
    user_id: User.where(first_name: "jc")[0].id,
    model: "Shiver 750",
    brand: "Aprilia",
    description: "description",
    category: "Road"
    },
  {
    user_id: User.where(first_name: "jc")[0].id,
    model: "Dorsoduro 750",
    brand: "Aprilia",
    description: "description",
    category: "Road"
    },
  {
    user_id: User.where(first_name: "jc")[0].id,
    model: "SR Max 300 ie",
    brand: "Aprilia",
    description: "description",
    category: "Scooter"
    },
  {
    user_id: User.where(first_name: "jc")[0].id,
    model: "SRV 850 ie",
    brand: "Aprilia",
    description: "description",
    category: "Scooter"
    },
  {
    user_id: User.where(first_name: "boris")[0].id,
    model: "C 650 Sport",
    brand: "BMW",
    description: "description",
    category: ""
    },
  {
    user_id: User.where(first_name: "boris")[0].id,
    model: " C 650 GT",
    brand: "BMW",
    description: "description",
    category: "Scooter"
    },
  {
    user_id: User.where(first_name: "boris")[0].id,
    model: "F 700 GS",
    brand: "BMW",
    description: "description",
    category: "Trail"
    },
  {
    user_id: User.where(first_name: "jordan")[0].id,
    model: "F 800 GS",
    brand: "BMW",
    description: "description",
    category: "Trail"
    },
  {
    user_id: User.where(first_name: "jordan")[0].id,
    model: "F 800 GT",
    brand: "BMW",
    description: "description",
    category: "Road"
    },
  {
    user_id: User.where(first_name: "jordan")[0].id,
    model: "Scrambler 800",
    brand: "Ducati",
    description: "description",
    category: "Road"
  },
    {
    user_id: User.where(first_name: "carl")[0].id,
    model: "YZ",
    brand: "Yamaha",
    description: "description",
    category: "Off-Road"
    },
  {
    user_id: User.where(first_name: "carl")[0].id,
    model: "CR",
    brand: "Honda",
    description: "description",
    category: "Off-Road"
    },
]


motorbikes.each do |m|
  motorbike = Motorbike.create!(m)
  if motorbike
    puts "motorbike '#{m[:brand]} #{m[:model]}' created"
    url = "http://downloadicons.net/sites/default/files/motorcycle-icon-60859.png"
    motorbike.photo_url = url
  end
end
