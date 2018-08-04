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

riders = Dir.glob("#{Rails.root}/app/assets/images/riders/*")
skate = Dir.glob("#{Rails.root}/app/assets/images/skateboards/*")
snow = Dir.glob("#{Rails.root}/app/assets/images/snowboards/*")
surf = Dir.glob("#{Rails.root}/app/assets/images/surfboards/*")
body = Dir.glob("#{Rails.root}/app/assets/images/bodyboards/*")

usernames = riders.map do |rider|
    new_rider = rider.gsub("/home/balez/code/cestbalez/bored/app/assets/images/riders/", '')
    new_rider.gsub('.jpg', '')
end

riders.each_with_index do |rider, i|

# !!!!!! CHANGE MY NAME WITH YOURS IN FOLDER PATH BELOW !!!!!!!!

  image = Cloudinary::Uploader.upload(rider, folder: "bored/heroku/rider")

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
    elsif board_type == 'skate'
      category_inst = skate.sample
    elsif board_type == 'body'
      category_inst = body.sample
    else
      category_inst = snow.sample
    end
# !!!!!! CHANGE MY NAME WITH YOURS IN FOLDER PATH BELOW !!!!!!!!

    image = Cloudinary::Uploader.upload(category_inst, folder: "bored/heroku/#{board_type}")

    board = Board.new(
    title: Faker::Dog.meme_phrase.capitalize,
    category: board_type,
    photo: image["url"],
    location: Faker::Address.full_address,
    latitude: rand * (-8.56 - -8.65) + -8.65,
    longitude: rand * (115.26 - 115.15) + 115.15,
    user_id: user.id,
      )
    board.write_attribute(:photo, image["url"])
    board.save
  end
end
