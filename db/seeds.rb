puts 'Destroying all flats'
Flat.destroy_all
puts 'All reveiws are destroyed'

puts 'creating flats'
100.times do
  Flat.create!(
    name: Faker::Science.tool,
    address: Faker::Address.full_address,
    picture_url: "http://source.unsplash.com/featured/?house&#{rand(1000)}",
    description: Faker::Marketing.buzzwords,
    price_per_night: rand(2000..50_000),
    number_of_guests: rand(1..10),
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end
puts "created #{Flat.count} flats."
