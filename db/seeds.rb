# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first


#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

# Booking.destroy_all
# Board.destroy_all
# User.destroy_all

# 10.times do

#   user = User.create(
#     email: Faker::Internet.email,
#     username: Faker::Internet.username,
#     password: 123456,
#     password_confirmation: 123456
#     )

#   rand(1..4).times do
#     board = Board.new(
#     title: Faker::Dog.meme_phrase.capitalize,
#     category: ['surf', 'skate', 'snow', 'body'].sample,
#     photo: "dsfasdf",
#     location: Faker::Address.full_address,
#     latitude: rand * (-8.56 - -8.65) + -8.65,
#     longitude: rand * (115.26 - 115.15) + 115.15,
#     user_id: user.id
#       )
#     board.write_attribute(:photo, "dsfasdf")
#     board.save
#     sleep(0.5)
#   end
# end

require 'faker'

Booking.destroy_all
Board.destroy_all
User.destroy_all

# Creating arrays with filepaths

riders = Dir.glob("#{Rails.root}/app/assets/images/riders/*")
skate = Dir.glob("#{Rails.root}/app/assets/images/skateboards/*")
snow = Dir.glob("#{Rails.root}/app/assets/images/snowboards/*")
surf = Dir.glob("#{Rails.root}/app/assets/images/surfboards/*")
body = Dir.glob("#{Rails.root}/app/assets/images/bodyboards/*")

# Getting board titles from csv-files

skate_titles = []
snow_titles = []
body_titles = []
surf_titles = []

CSV.foreach("#{Rails.root}/db/skateboards.csv") { |row| skate_titles = row }
CSV.foreach("#{Rails.root}/db/surfboards.csv") { |row| surf_titles = row }
CSV.foreach("#{Rails.root}/db/snowboards.csv") { |row| snow_titles = row }
CSV.foreach("#{Rails.root}/db/bodyboards.csv") { |row| body_titles = row }


# Extracting usernames from filenames

usernames = riders.map do |rider|
    new_rider = rider.gsub("/home/balez/code/cestbalez/bored/app/assets/images/riders/", '')
    new_rider.gsub('.jpg', '')
end

riders.each_with_index do |rider, i|

# !!!!!! CHANGE MY NAME WITH YOURS IN FOLDER PATH BELOW !!!!!!!!

  image = Cloudinary::Uploader.upload(rider, folder: "bored/magnus/rider")

  user = User.new(
    email: Faker::Internet.email,
    username: usernames[i],
    password: 123456,
    photo: image["url"],
    password_confirmation: 123456
    )

  user.save

  rand(1..4).times do
    board_type = ['surf', 'skate', 'body', 'snow'].sample
    if board_type == 'surf'
      category_inst = surf.sample
      titles = surf_titles
    elsif board_type == 'skate'
      category_inst = skate.sample
      titles = skate_titles
    elsif board_type == 'body'
      category_inst = body.sample
      titles = body_titles
    else
      category_inst = snow.sample
      titles = snow_titles
    end
# !!!!!! CHANGE MY NAME WITH YOURS IN FOLDER PATH BELOW !!!!!!!!

    image = Cloudinary::Uploader.upload(category_inst, folder: "bored/magnus/#{board_type}")

    board = Board.new(
    title: titles.sample,
    category: board_type,
    price: rand(5..30)
    photo: image["url"],
    location: Faker::Address.full_address,
    description: "I’m renting out my beloved Burton board that I bought 2 years ago. It still in a really good shape and is only waiting to be shred in some good powder.",
    latitude: rand * (-8.56 - -8.65) + -8.65,
    longitude: rand * (115.26 - 115.15) + 115.15,
    user_id: user.id,
      )
    board.write_attribute(:photo, image["url"])
    board.save
  end
end
