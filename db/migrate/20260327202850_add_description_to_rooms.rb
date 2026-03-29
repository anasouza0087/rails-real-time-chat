class AddDescriptionToRooms < ActiveRecord::Migration[8.1]
  def change
    add_column :rooms, :description, :string
  end
end
