class User < ApplicationRecord
  has_secure_password
  has_many :messages

  has_many :room_participants
  has_many :rooms, through: :room_participants

  has_many :owned_rooms,
           class_name: "Room",
           foreign_key: "owner_id"
end
