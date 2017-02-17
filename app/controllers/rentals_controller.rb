class RentalsController < ApplicationController
  before_action :set_motorbike, only: [ :new, :create, :accept, :decline, :show ]
  before_action :set_rental, only: [ :accept, :decline, :show ]
  def index
    @rentals = Rental.all
  end

  def create
    @rental = Rental.new()
    @rental.motorbike = @motorbike
    @rental.start_date = DateTime.parse(params['rental']['start_date'])
    @rental.end_date = DateTime.parse(params['rental']['end_date'])
    @rental.user = current_user
    @rental.save
    redirect_to user_path(current_user)
  end

  def show
    @rental = Rental.find(params[:id])
    @motorbike_coordinates = { lat: @motorbike.latitude, lng: @motorbike.longitude }
    @motorbike_array = [@motorbike]
    @hash = Gmaps4rails.build_markers(@motorbike_array) do |motorbike, marker|
      marker.lat motorbike.latitude
      marker.lng motorbike.longitude
    end
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
