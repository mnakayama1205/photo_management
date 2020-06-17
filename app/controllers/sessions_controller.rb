class SessionsController < ApplicationController
  def new
  end

  def create
    user_hash = {account_id: params[:account_id], password: params[:password]}

    if User.new(user_hash).valid?
      user = User.find_by(user_hash)
      if user
        session[:user] = user_hash
        redirect_to user_photos_url(user.account_id)
      end
    #else
      #validation error
    end
  end

  def delete
    session.delete(:user)
  end
end
