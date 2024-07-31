class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def login
    @user = User.find_by(username: login_params[:username])
    if @user&.authenticate(login_params[:password])
      token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: token }, status: :accepted
    else
      render json: { message: "Incorrect username or password" }, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end

end
