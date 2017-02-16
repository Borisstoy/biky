class ReviewsController < ApplicationController
  before_action :set_rental, only: [:new, :create]
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    rental = Rental.find(params[:rental_id])
    @review.rental = rental
    @review.save
    redirect_to user_path(current_user, tab_active: "past-rentals")
  end

  private

  def set_rental
    @rental = Rental.find(params[:rental_id])
  end

  def review_params
    params.require(:review).permit(:content, :rate)
  end
end
