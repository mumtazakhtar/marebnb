# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# A horse has a name, age, breed, location, description, price and user_id
# For starters, all horses are assigned to user 1 (is that needed?)

# Check if it is good practice to destroy_all in the seeds file?
puts 'First cleaning the database...'
Horse.destroy_all
puts 'Done!'

puts 'Creating new horses'

10.times do
  Horse.create(
    name: Faker::Name.name_with_middle,
    age: rand(0..30),
    breed: Faker::Creature::Horse.breed,
    location: "Netherlands",
    description: "What an amazing horse this is. Very horsey.",
    price: rand(75...199),
    user_id: 1
  )
end

puts 'Done. Just created 10 horses.'
