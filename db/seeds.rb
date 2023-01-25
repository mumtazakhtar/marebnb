# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

# A horse has a name, age, breed, location, description, price and user_id
# For starters, all horses are assigned to user 1 (is that needed?)

# Check if it is good practice to destroy_all in the seeds file?
puts 'First cleaning the database...'
Horse.destroy_all
User.destroy_all
puts 'Done!'

puts 'Creating two users'
User.create(first_name: 'Mumtaz', last_name: 'mohammed', email: 'reallymyemail@mail.com', password: 'fakepassword')
User.create(first_name: 'Nikki', last_name: 'kerpstra', email: 'alsomytruemail@mail.com', password: 'fakepassword')

puts 'Creating new horses and assigning to users'
10.times do
  horse = Horse.new(
    name: Faker::Name.name_with_middle,
    age: rand(0..30),
    breed: Faker::Creature::Horse.breed,
    location: "Netherlands",
    description: "What an amazing horse this is. Very horsey.",
    price: rand(75...199),
    user: User.all.sample
  )
  photo = URI.open("https://source.unsplash.com/random/?horse")
  horse.photo.attach(io: photo, filename: "#{horse.name}.png", content_type: "image/png")
  horse.save
end

puts 'Done. Just created 10 horses.'
