class RentalsController < ApplicationController
  before_action :set_motorbike, only: [ :new, :create ]
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

  private

  def set_motorbike
    @motorbike = Motorbike.find(params[:motorbike_id])
  end

end
