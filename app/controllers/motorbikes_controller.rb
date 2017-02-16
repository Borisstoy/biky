class MotorbikesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @location = params['location']
    @picked_start_date = params['start_date']
    @picked_end_date = params['end_date']
    @max_day_price = params['max-day-price']
    @max_eng_size = params['max-eng-size']
    @min_eng_size = params['min-eng-size']
    @category = params['category']
    picked_start_date = DateTime.parse(params['start_date']).to_time unless params['start_date'].blank?
    picked_end_date = DateTime.parse(params['end_date']).to_time unless params['end_date'].blank?


    motorbikes = Motorbike.all
    motorbikes = Motorbike.near(params['location'], 30) unless params['location'].blank?
    motorbikes = motorbikes.where(category: params['category']) unless params['category'].blank?
    motorbikes = motorbikes.where('day_price <= ?', params['max-day-price'].to_i) unless params['max-day-price'].blank?
    motorbikes = motorbikes.where('engine_size <= ?', params['max-eng-size'].to_i) unless params['max-eng-size'].blank?
    motorbikes = motorbikes.where('engine_size >= ?', params['min-eng-size'].to_i) unless params['min-eng-size'].blank?


    unless picked_start_date.nil? && picked_end_date.nil?
      motorbikes.each do |motorbike|
        unless motorbike.rentals.first.nil?
          mbk_end_date = motorbike.rentals.first.end_date.to_time
          mbk_start_date = motorbike.rentals.first.start_date.to_time
          if (mbk_start_date..mbk_end_date).include?(picked_end_date) && (mbk_start_date..mbk_end_date).include?(picked_start_date)
            motorbikes = motorbikes.reject{|m| m == motorbike}
          elsif (mbk_start_date..mbk_end_date).include?(picked_start_date)
            motorbikes = motorbikes.reject{|m| m == motorbike}
          elsif (mbk_start_date..mbk_end_date).include?(picked_end_date)
            motorbikes = motorbikes.reject{|m| m == motorbike}
          end
        end
      end
    end
    @motorbikes = motorbikes




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
    params.require(:motorbike).permit(:brand, :model, :description, :photo, :location, :engine_size, :kilometers, :circulation_date, :category, :day_price)
  end
end



