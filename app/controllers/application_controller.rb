class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def photo_payload(photos = SampleCatalog.photos)
    photos.map do |photo|
      photo.to_h.merge(
        author_avatar_url: helpers.image_path(SampleCatalog.find_user(photo.author_slug).avatar),
        author_url: helpers.user_path(photo.author_slug),
        detail_url: helpers.photo_path(photo.slug),
        image_url: helpers.image_path(photo.image),
        published_at_label: helpers.formatted_datetime(photo.published_at),
        share_url: helpers.photo_path(photo.slug)
      )
    end
  end
end
