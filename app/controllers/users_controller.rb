class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @rentals_booked = Rental.where(status: "Booked")
    @rentals_pending = Rental.where(status: "Pending")
    @user = User.find(params[:id])
    @rentals = current_user.rentals
    @review = Review.new
    @reviews = Review.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
