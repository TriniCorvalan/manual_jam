class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      render action: :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url, notice: 'Cerraste sesión correctamente'
  end
end
