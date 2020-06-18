class SessionsController < ApplicationController
  def new
  end

  def create
    user_hash = {account_id: params[:account_id], password: params[:password]}

    @user = User.new(user_hash)
    if @user.valid?
      user = User.find_by(user_hash)
      if user
        session[:user] = user_hash
        redirect_to user_photos_url(user.account_id)
      else
        @user.errors.add(:base, "ユーザーIDとパスワードが一致するユーザーが存在しません。")
        render :new
      end
    else
      render :new
    end
  end

  def delete
    session.delete(:user)
  end
end
