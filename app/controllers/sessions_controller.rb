class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.first_name}"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid username or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logout successful."
    redirect_to login_path
  end
end
