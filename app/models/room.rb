class Room < ApplicationRecord
  belongs_to :owner,
             class_name: "User"

  has_many :messages

  has_many :room_participants
  has_many :users, through: :room_participants
end
