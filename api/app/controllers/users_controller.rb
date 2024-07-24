class UsersController < ApplicationController
  skip_beofre_action :authorized, only: [:create]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_record_not_destroyed_response

  def profile
    render json: { user: current_user }, status: :accepted
  end

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = find_user
    render json: @user, status: :ok
  end

  def create
    @user = User.create!(user_params)
    @token = encode_token(user_id: @user.id)
    render json: { user: @user, jwt: @token }, status: :created
  end

  #fetch
  # .then((response) => {
  #   if (response.ok) {
  #     response.json().then((newMovie) => console.log(newMovie));
  #   } else {
  #     response.json().then((errorData) => setErrors(errorData.errors));
  #   }
  # })
  # JSX
  # {errors.length > 0 && (
  #   <ul style={{ color: "red" }}>
  #     {errors.map((error) => (
  #       <li key={error}>{error}</li>
  #     ))}
  #   </ul>
  # )}

  def update
    @user = find_user
    @user.update!(user_params)
    render json: @user, status: :accepted
  end

  def destroy
    @user = find_user
    @user.destroy!
    head :no_content
  end

  private

  def find_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :img_url)
  end

  # def user_params
  #   begin
  #     params.require(:user).permit(:username, :email, :password, :img_url)
  #   rescue ActionController::ParameterMissing => e
  #     render json: { error: e.message }, status: :bad_request
  #   end
  # end

  def render_not_found_response
    render json: { error: "User Not Found" }, status: :not_found
  end

  def render_unprocessable_entity_response(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_record_not_destroyed_response(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
