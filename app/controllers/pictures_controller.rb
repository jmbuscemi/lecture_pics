class PicturesController < ApplicationController
  before_action :set_picture, only: [:destroy]

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = session[:user_id]
    if @picture.save
      flash[:success] = "Picture successfully uploaded."
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @picture.destroy
    flash[:warning] = "Picture successfully destroyed."
    redirect_to root_path
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:id, :uploaded_file, :user_id)
    end
end
