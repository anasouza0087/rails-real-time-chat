class RoomsController < ApplicationController
  before_action :authorize_request
  before_action :set_room, only: [  :update, :destroy, :invite, :leave ]

  def index
    render json: current_user.rooms
  end

def show
  room = current_user.rooms.find_by(id: params[:id])

  if room
    render json: room
  else
    render json: { error: "Sala não encontrada" }, status: :not_found
  end
end

  def create
    room = Room.new(room_params)
    room.owner = current_user

    if room.save
      room.room_users.create(user: current_user)
      render json: room, status: :created
    else
      render json: { errors: room.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: { errors: @room.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    head :no_content
  end

  def invite
    user = User.find(params[:user_id])

    if @room.users.include?(user)
      return render json: { error: "Usuário já está na sala" }, status: :unprocessable_entity
    end

    room_user = @room.room_users.new(user: user)

    if room_user.save
      render json: { message: "Usuário convidado" }
    else
      render json: { errors: room_user.errors }, status: :unprocessable_entity
    end
  end

  def leave
    room_user = @room.room_users.find_by(user: current_user)

    if room_user
      room_user.destroy
      render json: { message: "Você saiu da sala" }
    else
      render json: { error: "Usuário não está na sala" }, status: :not_found
    end
  end

  private

  def set_room
    @room = current_user.rooms.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
