class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find_by(id: params[:room_id])

    if room
      stream_from "room_#{room.id}"
      Rails.logger.info "Subscribing to room #{room.id}"
    else
      reject
    end
  end

  def unsubscribed
  end
end
