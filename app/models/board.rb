class Board < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  has_one :location, through: :user
  has_one :latitude, through: :user
  has_one :longitude, through: :user

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: ['surf', 'skate', 'snow', 'body'] }
  validates :photo, presence: true
  validates :user_id, presence: true

  mount_uploader :photo, PhotoUploader
end
