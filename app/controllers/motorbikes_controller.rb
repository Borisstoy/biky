class MotorbikesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @motorbikes = Motorbike.all
  end

  def show
    @motorbike = Motorbike.find(params[:id])
    @rental = Rental.new
    @motorbike_coordinates = { lat: @motorbike.latitude, lng: @motorbike.longitude }
    @motorbike_array = [@motorbike]
    @hash = Gmaps4rails.build_markers(@motorbike_array) do |motorbike, marker|
      marker.lat motorbike.latitude
      marker.lng motorbike.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @motorbike = Motorbike.new
  end

  def create
    @motorbike = Motorbike.new(motorbike_params)
    @motorbike.user = current_user
    if @motorbike.save
      redirect_to motorbike_path(@motorbike)
    else
      render :new
    end
  end

  def edit
    @motorbike = Motorbike.find(params[:id])
  end

  def update
    @motorbike = Motorbike.find(params[:id])

    if @motorbike.update(motorbike_params)
      redirect_to motorbike_path(@motorbike)
    else
      render :edit
    end
  end

  def destroy
    motorbike = Motorbike.find(params[:id])
    motorbike.destroy
    redirect_to motorbikes_path
  end

  private

  def motorbike_params
    params.require(:motorbike).permit(:brand, :model, :description, :photo)
  end
end
