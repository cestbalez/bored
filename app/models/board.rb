class Board < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: ['surf', 'skate', 'kite', 'snow', 'wake'] }
  validates :photo, presence: true
  validates :location, presence: true
  validates :user_id, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
