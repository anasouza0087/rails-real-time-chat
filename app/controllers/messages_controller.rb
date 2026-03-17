class MessagesController < ApplicationController
  before_action :authorize_request
  before_action :set_room

  def index
  messages = @room.messages.includes(:user).order(created_at: :asc)

  render json: messages, include: :user
  end

  def create
    message = @room.messages.build(message_params)
    message.user = current_user

    if message.save
      render json: message, include: :user, status: :created
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = current_user.rooms.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
