class User < ApplicationRecord
  has_secure_password
  has_many :messages

  has_many :room_users
  has_many :rooms, through: :room_users

  has_many :owned_rooms,
           class_name: "Room",
           foreign_key: "owner_id"
end
