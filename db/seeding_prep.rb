require 'faker'

Booking.destroy_all
Board.destroy_all
User.destroy_all

10.times do

  user = User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: 123456,
    password_confirmation: 123456
    )

  rand(0..4).times do
    board = Board.create(
    title: Faker::Dog.meme_phrase.capitalize,
    category: ['surf', 'skate', 'body', 'snow'].sample,
    photo: "dsfasdf",
    location: Faker::Address.full_address,
    user_id: user.id,
      )
  end
end
