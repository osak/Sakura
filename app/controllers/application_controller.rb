class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'application'

  before_action :set_current_user
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def default_url_options
    if Rails.env.production?
      {:host => "sakura.osak.jp"}
    else
      {}
    end
  end
end
