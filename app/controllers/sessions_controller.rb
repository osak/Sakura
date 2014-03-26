class SessionsController < ApplicationController
  def callback
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to root_url, notice: "Logged in as #{user[:name]}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
