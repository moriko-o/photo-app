class PhotosController < ApplicationController
  def show
    @photo = SampleCatalog.find_photo(params[:slug])
    @author = SampleCatalog.find_user(@photo.author_slug)
  end
end
