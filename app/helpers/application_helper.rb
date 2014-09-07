module ApplicationHelper
  def user_can_upload?
    !!(@current_user && @current_user.can_upload)
  end
end
