class Board < ApplicationRecord
  belongs_to :user
  has_many :reviews
  belongs_to :booking

  validates :title, presence: true
  validates :type, presence: true, inclusion: { in: ['surf', 'skate', 'kite', 'snow', 'wake'] }
  validates :photo, presence: true
  validates :location, presence: true
  validates :user_id, presence: true
end
