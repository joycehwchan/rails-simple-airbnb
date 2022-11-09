class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    if params[:name]
      @flats = Flat.where('name LIKE ?', "%#{params[:name]}%")
    else
      @flats = Flat.all
    end
  end

  def show
    # generate_map
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def generate_map
    center = [@flat.latitude, @flat.longitude]
    token = "pk.eyJ1IjoieWFubmx1Y2tsZWluIiwiYSI6ImNqd3VvZmh0eDAwZzk0YWxjYmx1bmFpaDcifQ.R6oqb2VcNqMXhDf3S1Pb3A"
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{@flat.address}.json?proximity=ip&types=place%2Cpostcode%2Caddress&access_token=#{token}"
  end
end
