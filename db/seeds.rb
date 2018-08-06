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
    new_rider = rider.gsub("#{Rails.root}/app/assets/images/riders/", '')
    new_rider.gsub('.jpg', '')
end

# Looping through each user/rider

riders.each_with_index do |rider, i|

# Uploading user/rider photo to cloudinary

# !!!!!! CHANGE MY NAME WITH YOURS IN FOLDER PATH BELOW !!!!!!!!
  image = Cloudinary::Uploader.upload(rider, folder: "bored/magnus/rider")

# Creating a user instance

  user = User.new(
    email: Faker::Internet.email,
    username: usernames[i],
    password: 123456,
    photo: image["url"],
    password_confirmation: 123456
    )

  user.save

# Looping through a random amount of boards per user

  rand(1..5).times do

# Setting type of board and fetching filepath to board image from array

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

# Uploading board image to cloudinary

# !!!!!! CHANGE MY NAME WITH YOURS IN FOLDER PATH BELOW !!!!!!!!
    image = Cloudinary::Uploader.upload(category_inst, folder: "bored/magnus/#{board_type}")

# Creating new board

    board = Board.new(
    title: titles.sample,
    category: board_type,
    price: rand(5..30),
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
