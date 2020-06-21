class TweetsController < ApplicationController
  def create
    photo = Photo.find_by(id: params[:photo_id])
    data  = {
      text: params[:title],
      url: url_for(photo.photo),
    }

    headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer #{session[:access_token]}"
    }

    http = Net::HTTP.new("arcane-ravine-29792.herokuapp.com")
    response = http.post("/api/tweets", data.to_json, headers)
    Rails.logger.debug response.body
    redirect_to user_photos_url
  end
end
