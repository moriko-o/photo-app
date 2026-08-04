class PagesController < ApplicationController
  def mypage
    @user = SampleCatalog.current_user
    @photos = SampleCatalog.user_photos(@user.slug)
  end

  def about
    @about_sections = SampleCatalog.about_sections
  end
end
