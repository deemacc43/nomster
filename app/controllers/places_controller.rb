class PlacesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
    @places = Place.all
  end 

    def new
      @place = Place.new
  end

  def create
    current_user .Places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end


  private

  def place_params
    params.require(:place).peremit(:name, :description, :address)
  end

 end 

 def show
 end

 private

 def place_params
  params.require(:place).permit(:name, :description, :address)
 end


