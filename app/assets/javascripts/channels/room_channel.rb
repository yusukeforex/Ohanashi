class RoomChannel < ApplicationCable::RoomChannel
  def subscribed
    room = Room.find params[:room]
    stream_for room
  end
end
