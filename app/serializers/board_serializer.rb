class BoardSerializer < ActiveModel::Serializer
  attributes :id, :user, :name, :pics
  has_many :pictures

  def user
    {
      user_id: object.user.id,
      name: object.user.username
    }
  end

  def pics
    {
      pics: object.pictures
    }
  end
end
