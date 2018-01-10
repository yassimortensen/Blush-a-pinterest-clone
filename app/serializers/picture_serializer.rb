class PictureSerializer < ActiveModel::Serializer
  attributes :id, :url, :photographer_name, :photographer_link, :keyword
end
