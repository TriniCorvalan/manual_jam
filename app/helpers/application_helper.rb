module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def logged?
      session[:user_id].present? ? true : false
  end
end
