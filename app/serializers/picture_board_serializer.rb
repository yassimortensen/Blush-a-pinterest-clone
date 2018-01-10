class PictureBoardSerializer < ActiveModel::Serializer
  attributes :id, :picture, :board_id

  def picture
    {
      picture_url: object.picture.url
    }
  end
end
