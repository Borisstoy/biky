class RentalsController < ApplicationController
  before_action :set_motorbike, only: [ :new, :create, :accept, :decline, :show ]
  before_action :set_rental, only: [ :accept, :decline, :show ]
  def index
    @rentals = Rental.all
  end

  def create
    @rental = Rental.new()
    @rental.motorbike = @motorbike
    @rental.user = current_user
    @rental.save
    redirect_to user_path(current_user)
  end

  def show
  end

  def accept
    @rental.status = "Booked"
    @rental.save
    redirect_to user_path(@rental.motorbike.user)
  end

  def decline
    @rental.status = "Decline"
    @rental.save
    redirect_to user_path(@rental.motorbike.user)
  end

  private

  def rental_params
    params.require(:rental).permit(:status, :motorbike_id, :user_id, :start_date, :end_date)
  end

  def set_motorbike
    @motorbike = Motorbike.find(params[:motorbike_id])
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
