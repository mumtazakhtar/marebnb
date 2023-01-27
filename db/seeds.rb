# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"
# ActionController::Base.helpers.asset_pack_path

# A horse has a name, age, breed, location, description, price and user_id
# For starters, all horses are assigned to user 1 (is that needed?)

# Check if it is good practice to destroy_all in the seeds file?
puts 'First cleaning the database...'
Booking.destroy_all
Horse.destroy_all
User.destroy_all
puts 'Done!'

puts 'Creating two users'
User.create(first_name: 'Mumtaz', last_name: 'mohammed', email: 'reallymyemail@mail.com', password: 'fakepassword')
User.create(first_name: 'Nikki', last_name: 'kerpstra', email: 'alsomytruemail@mail.com', password: 'fakepassword')

puts 'Creating new horses and assigning to users'


horse10 = Horse.new(
  name: "Shamrock",
  age: 13,
  breed: "Irish Cob",
  location: "Paardenstraat 13, Vlissingen",
  description: "Instead of having to ride your bike through the snow, rent Jameson in wintertime!",
  price: 37,
  user: User.all.sample
)

horse11 = Horse.new(
  name: "Rainbow Dash",
  age: 1,
  breed: "My Little Pony",
  location: "Regenboogweg 15, Almere",
  description: "If you are actually a bit afraid of horses, this is the rental for you!",
  price: 5,
  user: User.all.sample
)

horse12 = Horse.new(
  name: "Isra Al",
  age: 4,
  breed: "Welsh Pony",
  location: "Weidelaan 55, Lekkerkerk",
  description: "Please return just as white and clean as she was delivered to you.",
  price: 75,
  user: User.all.sample
)

horse1 = Horse.new(
  name: "Mahlika",
  age: 13,
  breed: "Arabian Horse",
  location: "Vingboonsstraat 30, Hilversum",
  description: "Wow, how majestic! You can braid her long hair and go on a walk through the flowerfields together. Living the dream.",
  price: 125,
  user: User.all.sample
)

horse2 = Horse.new(
  name: "Golden Girl",
  age: 15,
  breed: "Oldenburger",
  location: "Weideweg 35, Elspeet",
  description: "Horsey horse. This is the perfect rent for if you want to take your horse on a swim!",
  price: 75,
  user: User.all.sample
)

horse3 = Horse.new(
  name: "Sir Edward III",
  age: 17,
  breed: "Oldenburger",
  location: "Edward Victor Appletonweg 17, Almere",
  description: "Surely a gentleman (or gentlehorse) with a name like this. Great horse. Much horsey.",
  price: 80,
  user: User.all.sample
)

horse4 = Horse.new(
  name: "Jimmy",
  age: 8,
  breed: "Irish Cob",
  location: "Ierlandstraat 8, Bergen op Zoom",
  description: "A real Irish horse, would ye look at that? Take him with you to the pub and offer him a pint!",
  price: 99,
  user: User.all.sample
)

horse5 = Horse.new(
  name: "Maxilya",
  age: 12,
  breed: "Arabian Horse",
  location: "Saharadreef 12, Utrecht",
  description: "Look at the little dots and freckles she has, what a cutie!",
  price: 65,
  user: User.all.sample
)

horse6 = Horse.new(
  name: "Dulcero XI",
  age: 6,
  breed: "Lusitano",
  location: "Bergweg 6, Blaricum",
  description: "As you can see, this horse used to travel a lot - it went outside the Netherlands to jump around in the mountains!",
  price: 97,
  user: User.all.sample
)

horse7 = Horse.new(
  name: "Unicorn",
  age: 99,
  breed: "Magical Creature",
  location: "Eenhoornsluis, Amsterdam",
  description: "You thought they didn't excist... but they do, and now you can even rent one!",
  price: 9999,
  user: User.all.sample
)

horse8 = Horse.new(
  name: "Novelle",
  age: 8,
  breed: "Arabian Friesian crossbred",
  location: "Bosweg 8, Hoogersmilde",
  description: "As you can see, she's quite a character! Only for experenced horse renters.",
  price: 112,
  user: User.all.sample
)

horse9 = Horse.new(
  name: "Winnie",
  age: 11,
  breed: "Fjord Horse",
  location: "Noorwegenstraat 45, Haarlem",
  description: "Fjord Horses are so pretty, and Winnie is no exception. You will definitely have all eyes on you when you rent this horse!",
  price: 45,
  user: User.all.sample
)

photo = File.open(Rails.root.join('app/assets/images/10.jpg'))
horse10.photo.attach(io: photo, filename: "#{horse10.name}.jpg", content_type: "image/jpg")
horse10.save

photo = File.open(Rails.root.join('app/assets/images/11.jpg'))
horse11.photo.attach(io: photo, filename: "#{horse11.name}.jpg", content_type: "image/jpg")
horse11.save

photo = File.open(Rails.root.join('app/assets/images/12.jpg'))
horse12.photo.attach(io: photo, filename: "#{horse12.name}.jpg", content_type: "image/jpg")
horse12.save

  photo = File.open(Rails.root.join('app/assets/images/1.jpg'))
  horse1.photo.attach(io: photo, filename: "#{horse1.name}.jpg", content_type: "image/jpg")
  horse1.save

  photo = File.open(Rails.root.join('app/assets/images/2.jpg'))
  horse2.photo.attach(io: photo, filename: "#{horse2.name}.jpg", content_type: "image/jpg")
  horse2.save

  photo = File.open(Rails.root.join('app/assets/images/3.jpg'))
  horse3.photo.attach(io: photo, filename: "#{horse3.name}.jpg", content_type: "image/jpg")
  horse3.save

  photo = File.open(Rails.root.join('app/assets/images/4.jpg'))
  horse4.photo.attach(io: photo, filename: "#{horse4.name}.jpg", content_type: "image/jpg")
  horse4.save

  photo = File.open(Rails.root.join('app/assets/images/5.jpg'))
  horse5.photo.attach(io: photo, filename: "#{horse5.name}.jpg", content_type: "image/jpg")
  horse5.save


  photo = File.open(Rails.root.join('app/assets/images/6.jpg'))
  horse6.photo.attach(io: photo, filename: "#{horse6.name}.jpg", content_type: "image/jpg")
  horse6.save

  photo = File.open(Rails.root.join('app/assets/images/7.jpg'))
  horse7.photo.attach(io: photo, filename: "#{horse7.name}.jpg", content_type: "image/jpg")
  horse7.save

  photo = File.open(Rails.root.join('app/assets/images/8.jpg'))
  horse8.photo.attach(io: photo, filename: "#{horse8.name}.jpg", content_type: "image/jpg")
  horse8.save

  photo = File.open(Rails.root.join('app/assets/images/9.jpg'))
  horse9.photo.attach(io: photo, filename: "#{horse9.name}.jpg", content_type: "image/jpg")
  horse9.save


puts 'Done. Just created 12 horses.'
