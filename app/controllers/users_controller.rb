class UsersController < ApplicationController
      skip_before_action :authorize_request, only: [ :create ]
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def me
    render json: {
      id: current_user.id,
      name: current_user.name,
      username: current_user.username
    }
  end


  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
