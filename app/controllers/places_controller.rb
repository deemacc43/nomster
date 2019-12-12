class PlacesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all
  end #lines 4-6

  def new
    @place = Place.new
  end #lines 8-10

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
    redirect_to root_path
  else
  render :new, status: :unprocessable_entity
  end #lines 12-18
 end
  def show
    @place = Place.find(params[:id])
    end #lines 20-22

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Not Allowed', status: forbidden
    end #lines 24-29
  end
   

  def update
      @place = Place.find(params[:id])

      if @place.user != current_user
        return render plain: 'Not Allowed', status: :forbidden
      end #lines 32-37

     @place.update_attributes(place_params)
     if @place.valid?
     redirect_to root_path
   else
    render :edit, status: :unprocessable_entity
  end #lines 39-44
end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end #lines 46-50
    
    @place.destroy
    redirect_to root_path
  end #lines 52-54


  private

  def place_params
    params.require(:place).permit(:name, :description, :address);
  end #lines 59-61
 end
 





