class ApplicationController < ActionController::API
  before_action :authorize_request

  attr_reader :current_user

  def authorize_request
    header = request.headers["Authorization"]

    if header
      token = header.split(" ").last
      decoded = JwtService.decode(token)

      if decoded
        @current_user = User.find(decoded[:user_id])
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    else
      render json: { error: "Missing token" }, status: :unauthorized
    end
  end
end
