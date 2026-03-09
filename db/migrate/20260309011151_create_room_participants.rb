class CreateRoomParticipants < ActiveRecord::Migration[8.1]
  def change
    create_table :room_participants do |t|
      t.integer :user_id
      t.integer :room_id
      t.datetime :joined_at

      t.timestamps
    end
  end
end
