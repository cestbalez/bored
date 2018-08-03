class Board < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: ['surf', 'skate', 'kite', 'snow', 'wake'] }
  validates :photo, presence: true
  validates :location, presence: true
  validates :user_id, presence: true

<<<<<<< HEAD
  mount_uploader :photo, PhotoUploader
=======
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
>>>>>>> e69ea9c3a89edd885e5731e8b47d4617bd94d6c2
end
