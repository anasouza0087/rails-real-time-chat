class Room < ApplicationRecord
  belongs_to :owner,
             class_name: "User"

  has_many :messages

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
end
