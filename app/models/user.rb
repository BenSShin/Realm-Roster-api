class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :characters
  has_many :groups, through: :characters
  has_many :messages
  has_many :combats
end
