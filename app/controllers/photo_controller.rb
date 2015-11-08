class PhotoController < ApplicationController

	def create
	    @photo = Photo.new(photo_params)
	    @photo.save
  	end
private
  def photo_params
    params.require(:photo).permit(:cronology_id, :image[])
  end

end
