class UsersController < ApplicationController
  before_action :logged_in?, except: [:new, :create]
  before_action :set_user, only: [:my_profile, :edit, :update, :destroy]

  def my_profile
    @picture = Picture.new
    @pictures = Picture.where(user: @user).order(created_at: :desc)
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
    if @user.update(user_params)
      flash[:info] = "#{@user.first_name.capitalize} successfully updated."
      redirect_to @user
    else
      flash[:alert] = "Error updating your account #{@user.first_name.capitalize}"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:alert] = "User was successfully destroyed."
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
end
