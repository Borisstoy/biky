class RentalsController < ApplicationController
  before_action :set_motorbike, only: [ :new, :create, :edit, :update ]
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

  def edit
  end

  def update
    @rental.update(rental_params)
    redirect_to user_path(current_user)
  end

  private

  def rental_params
    params.require(:rental).permit(:stauts, :motorbike_id, :user_id, :start_date, :end_date)
  end

  def set_motorbike
    @motorbike = Motorbike.find(params[:motorbike_id])
  end

end
