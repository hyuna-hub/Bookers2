class UsersController < ApplicationController
  def new
  	@user = User.new
    @book = Book.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to admin_user_url(@user)
  	else
  		render :new
  	end

    @book = Book.new(book_params)
       @book.user_id = current_user.id
    if @book.save
        flash[:notice] = 'Book was successfully created.'
        redirect_to book_path(@book.id)
    else
        @books = Book.all
        render :show
    end
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
  end
end
