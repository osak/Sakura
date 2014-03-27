module ApplicationHelper
  def user_can_upload?
    @current_user and @current_user.can_upload
  end
end
