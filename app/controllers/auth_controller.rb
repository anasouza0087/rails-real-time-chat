class AuthController < ApplicationController
  skip_before_action :authorize_request, only: [ :login ]
  def login
    user = User.find_by(username: params[:username])
    token = JwtService.encode(user_id: user.id)

    if user&.authenticate(params[:password])
      render json: {
        message: "Login successful",
        token: token,
        user: {
        id: user.id,
        name: user.name,
        username: user.username
  }
}
    else
      render json: {
        error: "Invalid username or password"
      }, status: :unauthorized
    end
  end

  def logout
  end
end
