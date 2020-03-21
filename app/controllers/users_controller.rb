class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to admin_user_url(@user)
  	else
  		render :new
  	end
  end

  def show
  	@user = User.find(params[:id])
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    @profile_image = Profile_image.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @profile_image = Profile_image.find(params[:id])
    @user.update(user_params)
    @profile_image.update(profile_image_params[:id])
    redirect_to user_path(@user.id)
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
  end
end
