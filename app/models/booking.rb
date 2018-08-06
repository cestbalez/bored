class Booking < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :board_id, presence: true

  validates_date :start_date, on: :create, on_or_after: :today
  validates_date :end_date, on: :create, after: :start_date

  def total_booking_duration
    (end_date - start_date).to_i
  end

  def total_booking_price
    (total_booking_duration * board.price).to_i
  end
end

