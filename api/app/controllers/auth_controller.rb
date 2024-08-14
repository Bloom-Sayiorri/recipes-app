class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: user_login_params[:username])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def me
    @token = params[:token]
    user = User.find(JWT.decode(@token, "put your secret password here", true, algorithm: 'HS256')[0]["user_id"])
    render json: user
  end

  private

  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.permit(:username, :password)
  end
end

# class SessionsController < ApplicationController
#   # skip_before_action :authorize, only: [:create]

#    def create
#      user = User.find_by(username: session_params[:username])

#      if user&.authenticate(session_params[:password])
#        token = encode_token({ username: user.username })
#        render json: { loggedin: true, user: user.slice(:id, :username, :admin), jwt: token }, status: :created
#      else
#        render json: { error: 'Invalid username or password' }, status: :unauthorized
#      end
#    end

#    def destroy
#       @current_user = nil
#      session.delete(:jwt_token)
#      render json: { message: 'Logged out successfully' }
#    end

#    private

#    def session_params
#      params.permit(:username, :password)
#    end
#  end
