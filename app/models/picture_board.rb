class PictureBoard < ApplicationRecord
  belongs_to :board
  belongs_to :picture
end
