# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first


#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Board.destroy_all

100.times do

  user = User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: 123456,
    password_confirmation: 123456
    )

  board = Board.create(
  title: Faker::Dog.meme_phrase.capitalize,
  category: ['surf', 'skate', 'kite', 'snow', 'wake'].sample,
  photo: "dsfasdf",
  location: Faker::Address.full_address,
  user_id: user.id,
    )
end
