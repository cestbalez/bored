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

  rand(1..4).times do
    board = Board.new(
    title: Faker::Dog.meme_phrase.capitalize,
    category: ['surf', 'skate', 'snow', 'body'].sample,
    photo: "dsfasdf",
    location: Faker::Address.full_address,
    latitude: rand * (-8.56 - -8.65) + -8.65,
    longitude: rand * (115.26 - 115.15) + 115.15,
    user_id: user.id
      )
    board.write_attribute(:photo, "dsfasdf")
    board.save
    sleep(0.5)
  end
end
