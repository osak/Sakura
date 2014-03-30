require 'digest/sha1'

class SessionsController < ApplicationController
  def create
    encrypted_pass = encrypt(post_data[:password])
    user = User.find_by_name_and_password(post_data[:name], encrypted_pass)
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in as #{user[:name]}"
    else
      redirect_to root_url, notice: "Login failed"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end

  private

  def encrypt(pass)
    salted = Rails.application.secrets.salt + pass
    Digest::SHA1.hexdigest(salted)
  end

  def post_data
    params.permit(:name, :password)
  end
end
