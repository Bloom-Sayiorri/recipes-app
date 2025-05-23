class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 'my_s3cr3t', true,  algorithm: 'HS256')
      rescue JWT::DecodeError
        return nil
      end
    end
  end

  def current_user
    #decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
    # or nil if we can't decode the token
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: "Please login!!" }, status: :unauthorized unless logged_in?
  end

end
