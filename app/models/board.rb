class Board < ApplicationRecord
  belongs_to :user
  has_many :reviews
  belongs_to :booking
end
