class PhotoController < ApplicationController
  before_action :authenticate_user!

  def create
    @photos = Photo.find(params[:place_id])
    @place.photo.create(photo_params.merge(user: current_user))
    redirect_to place_path(@place)
   end

   private

   def photo_params
    params.require(:photo).permit(:caption)
  end
end