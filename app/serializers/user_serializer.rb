class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email
  has_many :boards

end
