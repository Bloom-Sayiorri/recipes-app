class RecipesController < ApplicationController
  skip_before_action :authorized, only: [:index]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  # Handle logged in user making crud operations.

  def index
    user = find_user
    if user
      recipes = Recipe.all
      render json: recipes, status: :ok
    else
      render json: { erros: ["You must be logged in."] }, status: :unauthorized
    end
  end

  def show
    user = find_user
    if user
      recipe = find_recipe
      render json: recipe, status: :ok
    else
      render json: { errors: ["You must be logged in."] }, status: :unauthorized
    end
  end

  def create
    user = find_user
    if user
      recipe = user.recipes.create(recipe_params)
      if recipe.valid?
        render json: recipe, status: :created
      else
        render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ["You must be logged in."] }, status: :unauthorized
    end
  end


  def update
    user = find_user
    if user
      recipe = find_recipe
      recipe.update!(recipe_params)
      render json: recipe, status: :created
    else
      render json: { errors: { message: "You must be loggged in to edit recipes." } }, status: :unauthorized
    end
  end

  def destroy
    user = find_user
    if user
      recipe = find_recipe
      recipe.destroy!
      head :no_content
    end
  end

  private

  def find_recipe
    Recipe.find_by(id: params[:id])
  end

  def find_user
    User.find_by(id: login_params[:user_id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :image, :description, :country_of_origin, :serving, :ingredients, :instructions, :date_time)
  rescue ActionController::ParameterMissing
    render json: { message: "Use correct recipes parameters." }, status: :bad_request
  end

  def render_not_found
    render json: { errors: "Recipe not found!" }, status: :not_found
  end

  def render_invalid(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_destroyed(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
