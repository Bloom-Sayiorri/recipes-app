class ReviewsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  def index
    reviews = Review.all
    render json: reviews, status: :ok
  end

  def show
    review = find_review
    render json: review, status: :ok
  end

  def create
    review = Review.create!(review_params)
    render json: review, status: :created
  end

  private

  def find_review
    Review.find(params: [:id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end

  def render_not_found
    render json: { errors: ["Review not found!"] }, status: :not_found
  end

  def render_invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_destroyed
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
