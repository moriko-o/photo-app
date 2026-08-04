class BookmarksController < ApplicationController
  def index
    @photos = SampleCatalog.bookmarked_photos
    @photo_payload = photo_payload(@photos)
  end
end
