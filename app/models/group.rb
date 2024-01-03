class Group < ApplicationRecord
  has_many :characters
  has_many :users, through: :characters
  has_many :messages
  has_many :events
end
