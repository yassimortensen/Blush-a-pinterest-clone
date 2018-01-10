class Picture < ApplicationRecord
  has_many :picture_boards
  has_many :boards, through: :picture_boards

  validates :url, presence: true
  validates :url, uniqueness: true

end
