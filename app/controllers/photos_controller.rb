class PhotosController < ApplicationController
  before_action :check_login
  def index
    @photos = User.find_by(account_id: params[:user_id]).try(:photos).order(created_at: :desc)
    
  end

  def new
    @photo = Photo.new(user_id: params[:user_id])
  end

  def create
    User.find_by(account_id: params[:user_id]).photos.create(photo_params)
    redirect_to user_photos_path(user_id: params[:user_id])
  end

  private

  def check_login
    redirect_to root_path if session[:user].blank?
  end

  def photo_params
    params.require(:photo).permit(:title, :photo)
  end
end
