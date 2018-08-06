class Booking < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :board_id, presence: true

  validates_date :start_date, on: :create, on_or_after: :today
  validates_date :end_date, on: :create, after: :start_date

  # private
  # def reservation_dates_must_makes_sense
  #   if end_date <= start_date
  #     errors.add (:start_date, 'has to be before end date')
  #   end
  # end
end

