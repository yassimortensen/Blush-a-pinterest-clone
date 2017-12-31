class Board < ApplicationRecord
  belongs_to :user
  has_many :picture_boards
  has_many :pictures, through: :picture_boards

  validates :user_id, presence: true
  validates :name, presence: true

end
