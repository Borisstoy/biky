# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ model: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Motorbike.destroy_all

motorbikes = [
  {
    user_id: 1,
    model: "Shiver 750",
    brand: "Aprilia",
    },
  {
    user_id: 1,
    model: "Dorsoduro 750",
    brand: "Aprilia",
    },
  {
    user_id: 1,
    model: "SR Max 300 ie",
    brand: "Aprilia",
    },
  {
    user_id: 1,
    model: "SRV 850 ie",
    brand: "Aprilia",
    },
  {
    user_id: 1,
    model: "C 650 Sport",
    brand: "BMW",
    },
  {
    user_id: 1,
    model: " C 650 GT",
    brand: "BMW",
    },
  {
    user_id: 1,
    model: "F 700 GS ",
    brand: "BMW",
    },
  {
    user_id: 1,
    model: "F 800 GS",
    brand: "BMW",
    },
  {
    user_id: 1,
    model: "F 800 GT",
    brand: "BMW",
    },
  {
    user_id: 1,
    model: "Scrambler 800",
    brand: "Ducati",
    },
]


motorbikes.each { |m| Motorbike.create(m) }
