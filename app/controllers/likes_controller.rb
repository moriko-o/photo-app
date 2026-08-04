class LikesController < ApplicationController
  def index
    @photos = SampleCatalog.liked_photos
  end
end
