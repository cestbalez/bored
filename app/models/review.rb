class Review < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :user_id, presence: true
  validates :board_id, presence: true
end
