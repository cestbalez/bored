class Board < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: ['surf', 'skate', 'kite', 'snow', 'wake'] }
  validates :photo, presence: true
  validates :location, presence: true
  validates :user_id, presence: true
end
