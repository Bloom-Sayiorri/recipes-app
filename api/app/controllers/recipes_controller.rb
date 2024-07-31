class RecipesController < ApplicationController
  skip_before_action :authorized, only: [:index]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  # Handle logged in user making crud operations.

  def index
    # user = User.find_by(login_params [:user_id])
    recipes = Recipe.all
    render json: recipes
  end

  def show
    recipe = find_recipe
    render json: recipe
  end

  def create
    recipe = Recipe.create!(recipe_params)
    render json: recipe, status: :created
  end


  def update
    recipe = find_recipe
    recipe.update!(recipe_params)
    render json: recipe, status: :created
  end

  private

  def find_recipe
    Recipe.find(params[:id])
  end

  def recipe_params
    params.permit(:name, :image, :description, :country_of_origin, :serving, :ingredients, :instructions, :date_time)
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
