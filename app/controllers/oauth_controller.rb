class OauthController < ApplicationController

  def callback
    return unless params[:code]

    post_params = {
      code: params[:code],
      client_id: "af361473b5c79159de9467b4a9c1721520809d48295accbf799402ae2141df33",
      client_secret: "418b9621b18b2796b03d16c6dbe55f22eed31738722622783864a971d7e328a5",
      redirect_uri: "http://localhost:3000/oauth/callback",
      grant_type: "authorization_code"
    }

    uri = URI.parse("https://arcane-ravine-29792.herokuapp.com/oauth/token")
    response = Net::HTTP.post_form(uri, post_params)

    session[:access_token] = JSON.parse(response.body)["access_token"]
    redirect_to user_photos_url(params[:state])
  end
end
