class SessionsController < ApplicationController
  def login
    if request.post?
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome #{user.first_name}"
        redirect_to root_path
        # redirect_to root_path, notice: "Login successful."
      else
        flash[:alert] = 'Invalid username or password.'
        # flash.now[:notice] = "Invalid username or password."
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Logout successful."
    redirect_to login_path
    # redirect_to login_path, notice: "Logout successful."
  end
end
