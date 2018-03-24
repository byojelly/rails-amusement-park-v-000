class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  def index
    @attractions = Attraction.all
  end
  def new
    @attraction = Attraction.new
  end
  def create
      @attraction = Attraction.new(attration_params)
      if @attraction.save
          redirect_to @attra, notice: 'Attraction was successfully create.'
      else
          render :new
      end
  end
  def show
    @ride = Ride.new
  end
  def edit
  end
  def update
      if @attraction.update(attraction_params)
          redirect_to @attraction, notice: "Attraction was successfully updated"
      else
          render :edit
      end
  end
  def destroy
      @attraction.destroy
      redirect_to attractions_url, notice: 'Attraction was successfully destroyed.'
  end


  private
  def set_attraction
    @attraction = Attraction.find(params[:id])
  end
  def attration_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end
end
