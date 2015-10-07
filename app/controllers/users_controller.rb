class UsersController < ApplicationController
  before_action :logged_in?, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @picture = Picture.new
    @pictures = @user.pictures.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:info] = "#{@user.first_name.capitalize} successfully created."
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:info] = "#{@user.first_name.capitalize} successfully updated."
        format.html { redirect_to @user }
      else
        flash[:alert] = "Error updating your account #{@user.first_name.capitalize}"
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    flash[:alert] = "User was successfully destroyed."
    # redirect_to @user
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(session[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :first_name, :last_name, :email, :password,
          :password_confirmation)
    end

    def logged_in?
      @user = User.find_by_id(session[:user_id])
      unless @user
        if session[:user_id] == nil
          redirect_to login_path
        else
          flash[:info] = "Please login"
          redirect_to login_path
        end
      end
    end
end
