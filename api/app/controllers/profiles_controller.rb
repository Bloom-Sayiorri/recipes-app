class ProfilesController < ApplicationController
  # before_action :authenticate_user!

  def show
    render json: current_user.slice(:username, :first_name, :last_name, :email, :bio, :avatar)
  end

  def update
    @user = current_user
    if @user.authenticate(profile_params[:current_password])
      if @user.update(user_params) && @user.profile.update(profile_params.except(:current_password, :email))
        render json: @user.slice(:username, :first_name, :last_name, :email, :bio, :avatar), status: :ok
      else
        render json: { errors: @user.errors.full_messages + @user.profile.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['Current password is incorrect'] }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:profile).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def profile_params
    params.require(:profile).permit(:username, :first_name, :last_name, :bio, :avatar, :current_password, :password, :password_confirmation)
  end
end
