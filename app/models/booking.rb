class Booking < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :board_id, presence: true

  validates_date :start_date, on: :create, on_or_after: :today
  validates_date :end_date, on: :create, after: :start_date
end
