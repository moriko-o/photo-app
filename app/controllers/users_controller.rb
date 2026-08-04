class UsersController < ApplicationController
  def show
    @user = SampleCatalog.find_user(params[:slug])
    @photos = SampleCatalog.user_photos(@user.slug)
  end
end
