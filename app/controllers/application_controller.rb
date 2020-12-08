class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  helper_method :current_user

  def logged?
      session[:user_id].present? ? true : false
  end
  

  helper_method :logged?

  def user_login
    if !logged?
      redirect_to new_session_path, notice: 'Ingresa a tu sesion'
    end
  end

end
