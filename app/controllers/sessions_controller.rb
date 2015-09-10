class SessionsController < ApplicationController
  def login
    if request.post?
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "Login successful."
      else
        flash.now[:notice] = "Invalid username or password."
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: "Logout successful."
  end
end
