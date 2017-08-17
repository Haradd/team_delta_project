if User.count < 100
  puts "Creating users..."
  50.times do
    User.create!(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      password: FFaker::Internet.password,
      email: FFaker::Internet.email,
      phone: FFaker::PhoneNumberAU.mobile_phone_number.gsub!(/\s/, '').slice(1..9),
      city: FFaker::Address.city,
      street: FFaker::Address.street_name,
    )
    print '.'
  end
  puts "500 Users created!"
end


puts "Creating adverts..."
# users = User.first
rand(50).times do
  title_length = rand(10) + 1
  user = rand(500) + 1
  Advert.create!(
    user: User.find(user),
    title: FFaker::Lorem.words(title_length).join(" "),
    description: FFaker::Lorem.sentence,
    city: FFaker::Address.city,
    street: FFaker::Address.street_name,
    phone: FFaker::PhoneNumberAU.mobile_phone_number.gsub!(/\s/, '').slice(1..9),
    price: rand(1..100),
    job_type: JOB_TYPES.sample,
    advert_type: ADVERT_TYPES.sample
  )
  print "."
end

puts "Adverts created"# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
