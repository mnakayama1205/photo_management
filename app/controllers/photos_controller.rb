class PhotosController < ApplicationController
  before_action :check_login
  def index
    #before_actionでログインチェックを行う
  end

  def edit
  end

  private

  def check_login
    redirect_to root_path if session[:user].blank?
  end
end
