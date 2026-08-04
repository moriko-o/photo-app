class HomeController < ApplicationController
  def index
    @photos = SampleCatalog.randomized_photos
    @current_photo = @photos.first
    @photo_payload = photo_payload(@photos)
  end
end
