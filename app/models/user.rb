class User < ApplicationRecord
  has_many :boards

  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true

  has_secure_password

end
