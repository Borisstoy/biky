puts "Destory of all motorbikes & users"
Motorbike.destroy_all
User.destroy_all

puts "Creation of JC, Boris, Jordan & Carl profiles (takes time because of uploading images)"
carl = User.create!(
  {
    email: "carl@biky.com",
    password: "123456",
    first_name: "carl"
  }
)
carl_pic_url = "https://yt3.ggpht.com/-iY9QAJh35ac/AAAAAAAAAAI/AAAAAAAAAAA/otPaUtPzYjc/s900-c-k-no-mo-rj-c0xffffff/photo.jpg"
carl.photo_url = carl_pic_url

jordan = User.create!(
  {
    email: "jordan@biky.com",
    password: "123456",
    first_name: "jordan"
  }
)
jordan_pic_url = "https://pbs.twimg.com/media/BiiXHv_IMAAUXqD.jpg"
jordan.photo_url = jordan_pic_url

boris = User.create!(
  {
    email: "boris@biky.com",
    password: "123456",
    first_name: "boris"
  }
)
boris_pic_url = "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAARzAAAAJDdkMmE3ZDEzLWVmYjgtNDJjOC1hYTI0LTE3ZmVkMjRmNmI5ZA.jpg"
boris.photo_url = boris_pic_url

jc = User.create!(
  {
    email: "jc@biky.com",
    password: "123456",
    first_name: "jc"
  }
)
jc_pic_url = "https://pbs.twimg.com/profile_images/1816740099/image.jpg"
jc.photo_url = jc_pic_url


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
    user_id: User.where(first_name: "boris")[0].id,
    model: "C 650 Sport",
    brand: "BMW",
    description: "description",
    category: ""
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
    model: "Scrambler 800",
    brand: "Ducati",
    description: "description",
    category: "Road"
  },
    {
    user_id: User.where(first_name: "carl")[0].id,
    model: "YZF 450",
    brand: "Yamaha",
    description: "description",
    category: "Off-Road"
    },
  {
    user_id: User.where(first_name: "carl")[0].id,
    model: "CRF 450",
    brand: "Honda",
    description: "description",
    category: "Off-Road"
    },
]

motorbikes_url = [
  "http://www.aprilia.com/assets/aprilia-sites/master/models/moto/road/Shiver-750-ABS/gallery/my14/shiverabs_my14-34dx-Formula_red/original/shiverabs_my14-34dx-Formula_red.jpg",
  "http://www.moto-station.com/ttesimages/motodivers/nouveautes2008/Aprilia_SMV_750_Dorsoduro_st3pz.jpg",
  "http://databikes.com/imgs/a/a/d/a/t/aprilia__sr_max_300_i_e__2012_2_lgw.jpg",
  "http://www.motorevue.com/wp-content/uploads/2014/8/91795/5.jpg",
  "https://www.motoplanete.com/bmw/zoom-700px/BMW-F-700-GS-2014-700px.jpg",
  "http://media.motoservices.com/media/cache/vehicle_detail/media/vehicle/885/BMW-F800GS-2013.jpg",
  "http://cdn.powersportstv.com/392816_4_2016_Ducati_Scrambler_800_Full_Throttle.jpg",
  "https://i.ytimg.com/vi/TDEGxGcMuII/maxresdefault.jpg",
  "http://motocross.transworld.net/wp-content/blogs.dir/441/files/2015/08/Ride-Engineering-CRF450-Project-Bike-600x413.png"
]

i = 0
motorbikes.each do |m|
  motorbike = Motorbike.create!(m)
  if motorbike
    puts "motorbike '#{m[:brand]} #{m[:model]}' created"
    motorbike.photo_url = motorbikes_url[i]
  end
  i += 1
end
